# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

{
    spesa: Tag::COLORS[0],
    macchina: Tag::COLORS[1],
    farmacia: Tag::COLORS[2],
    mangiare_fuori: Tag::COLORS[3],
    casa: Tag::COLORS[4],
    prelievo: Tag::COLORS[5],
    divertimento: Tag::COLORS[6],
    viaggi: Tag::COLORS[7],
    bollette_internet: Tag::COLORS[8],
    bollette_luce: Tag::COLORS[9],
    bollette_gas: Tag::COLORS[10],
    bollette_acqua: Tag::COLORS[11],
    bollette_varie: Tag::COLORS[12],
    mutuo: Tag::COLORS[13],
    hobby: Tag::COLORS[14],
    # autostrada: Tag::COLORS[15],
    # spesa: Tag::COLORS[16],
    # spesa: Tag::COLORS[17],
    # spesa: Tag::COLORS[18],
    # spesa: Tag::COLORS[19],

}.each do |k,v|
    Tag.find_or_create_by!(name: k, color: v)
end

Rule.find_or_create_by!(operator: :contains, value: 'giroconto', action: :ignore)