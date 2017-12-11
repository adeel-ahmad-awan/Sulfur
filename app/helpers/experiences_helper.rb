module ExperiencesHelper


  def randomcardcolor
    num = rand(1..5)
    if num == 1
      return "card-header-blue"
   elsif num == 2
     return "card-header-orange"
   elsif num == 3
     return "card-header-grey"
   elsif num == 4
     return "card-header-pink"
   else
     return "card-header-red"
   end
  end


end
