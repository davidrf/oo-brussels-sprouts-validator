class Ingredient
  attr_reader :name

  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@name}\n"
  end

  def self.parse(ingredient)
    ingredient = ingredient.split
    self.new(ingredient[0], ingredient[1], ingredient[2])
  end
end

class Recipe
  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    ingredient_list = ""

    @ingredients.each do |ingredient|
      ingredient_list += "- #{ingredient.summary}"
    end

    instruction_list = ""
    @instructions.each_with_index do |instruction, index|
      instruction_list += "- #{instruction}\n"
    end

    "Name: #{@name}\n\nIngredients\n#{ingredient_list}\nInstructions\n#{instruction_list}"
  end

  def valid_ingredients?
    edible = %w(spinach eggs milk tofu seitan quinoa kale chocolate beer wine whiskey)
    edible += ["brussels sprouts", "bell peppers"]
    @ingredients.all? { |ingredient| edible.include?(ingredient.name.downcase) }
  end
end


bad_name = "Roasted Brussels Sprouts"

bad_ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

bad_instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

good_name = "Jameson"
good_ingredients  = [Ingredient.new(1, "fifth", "whiskey")]
good_instructions = ["chug"]

bad_recipe = Recipe.new(bad_name, bad_instructions, bad_ingredients)
puts bad_recipe.valid_ingredients?

good_recipe =Recipe.new(good_name, good_instructions, good_ingredients)
puts good_recipe.valid_ingredients?

ingredient = Ingredient.parse("47 lb(s) Brussels sprouts")
puts ingredient.summary
