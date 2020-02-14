hash= {
      "Electronics" => [
                          {name: "Mobile"}, 
                          {name: "AC"}, 
                          {name: "TV"}, 
                          {name: "Speaker"}
                        ],
      "Footwares" => [ 
                        {name: "Shoes"}, 
                        {name: "Sneekers"}
                    ],
      "Men" => [
                  {name: "Shirt"},
                  {name: "T-shirt"},
                  {name: "Blazzer"},
                  {name: "Trake Pants"}
                ],
      "Women" => [
                  {name:"Saree"},   
                  {name:"Kurta"},   
                  {name:"Lehnga"},   
                  {name:"Dupatta"}   
                  ],
      "Baby&Kids" => [
                      {name: "Remote Control Toy"},  
                      {name: "Soft Toy"},  
                      {name: "Outdoor Toy"},  
                      {name: "Indoor Toy"}  
                       ]
}

hash.each do |key, values|
  category =  Category.create(name: key)
  category.sub_categories.create(values)
end