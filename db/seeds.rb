b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

style1 = Style.create name:"Lager"
style2 = Style.create name:"Pale Ale"
style3 = Style.create name:"Porter"
style4 = Style.create name:"Weizen"

b1.beers.create name:"Iso 3", style_id:style1.id
b1.beers.create name:"Karhu", style_id:style1.id
b1.beers.create name:"Tuplahumala", style_id:style1.id
b2.beers.create name:"Huvila Pale Ale", style_id:style2.id
b2.beers.create name:"X Porter", style_id:style3.id
b3.beers.create name:"Hefeweizen", style_id:style4.id
b3.beers.create name:"Helles", style_id:style1.id