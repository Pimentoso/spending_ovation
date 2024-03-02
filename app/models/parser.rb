class Parser
    attr_reader :file_path, :running, :finished, :dev, :current_tx_line

    def initialize(file_path:, dev: false)
        @file_path = file_path
        @running = false
        @finished = false
        @dev = dev
        @current_tx_line = ''
    end

    def parse
        io = File.open("/home/miche/Downloads/EstrattoConto_232616479.pdf", 'rb')
        reader = PDF::Reader.new(io)
        reader.pages.each do |page|
            break if finished
            lines = page.text.scan(/^.+/)
            lines.each do |r|
                r.strip!
                next if r.blank?
                if r.include?('SALDO INIZIALE')
                    @running = true
                    next
                elsif r.start_with?('Pag. ')
                    tx_from_line
                    @running = false
                    next
                elsif r == ('OPERAZIONE')
                    @running = true
                    next
                elsif r.include?('SALDO FINALE')
                    tx_from_line
                    @finished = true
                    break
                end

                if running

                    if r.match?(/^\d{2}\/\d{2}\/\d{4}/) && r.length > 52
                        tx_from_line
                        @current_tx_line = r
                    elsif r.length <= 52
                        @current_tx_line += ' ' + r
                    end

                end
            end
        end
    end

    def tx_from_line
        return if current_tx_line.blank?

        puts "----- #{current_tx_line.length} ----------------------------------------------" if dev
        puts current_tx_line[0..80]

        date = current_tx_line[0..9].to_date
        puts date if dev
        amount_out = string_to_amount(current_tx_line[32..52])
        puts current_tx_line[32..52] if dev
        puts amount_out if dev
        amount_in = string_to_amount(current_tx_line[53..68])
        puts current_tx_line[53..68] if dev
        puts amount_in if dev
        description = current_tx_line[69..-1].squish
        puts description if dev

        Payment.create!(
            date:,
            description:,
            direction: amount_in > 0 ? :inbound : :outbound,
            amount: [amount_in, amount_out].max
        ) unless dev

        @current_tx_line = ''
    end     
    
    def string_to_amount(str)
        str.gsub(/\D/, '').squish.to_i
    end
end