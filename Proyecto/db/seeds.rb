puts "Filling database..."

#
# RECIPES
#

####################### First recipe #######################
recipe_materials = []

scallions = Raw.create(name: 'Scallions', type: 'fresh', measure: 'unit', cost: '5')
RawInventory.create(quantity: 10, expired_at: '2018-05-01', raw: scallions)
recipe_materials << RecipeMaterial.create(raw: scallions, quantity: 2)

rice = Raw.create(name: 'Jasmine Rice', type: 'miscellaneous', measure: 'kilogram', cost: '30')
RawInventory.create(quantity: 1, expired_at: '2018-05-10', raw: rice)
recipe_materials << RecipeMaterial.create(raw: rice, quantity: 0.1)

lemon = Raw.create(name: 'Lemon', type: 'fresh', measure: 'unit', cost: '5')
RawInventory.create(quantity: 20, expired_at: '2018-05-05', raw: lemon)
recipe_materials << RecipeMaterial.create(raw: lemon, quantity: 1)

zucchini = Raw.create(name: 'Zucchini', type: 'fresh', measure: 'kilogram', cost: '100')
RawInventory.create(quantity: 1, expired_at: '2018-05-02', raw: zucchini)
recipe_materials << RecipeMaterial.create(raw: zucchini, quantity: 1)

basil_oil = Raw.create(name: 'Basil Oil', type: 'miscellaneous', measure: 'liter', cost: '100')
RawInventory.create(quantity: 1, expired_at: '2019-05-05', raw: basil_oil)
recipe_materials << RecipeMaterial.create(raw: basil_oil, quantity: 0.025)

shrimp = Raw.create(name: 'Shrimp', type: 'meat', measure: 'kilogram', cost: '50')
RawInventory.create(quantity: 1, expired_at: '2018-05-01', raw: shrimp)
recipe_materials << RecipeMaterial.create(raw: shrimp, quantity: 0.05)

chili_flakes = Raw.create(name: 'Chili Flakes', type: 'fresh', measure: 'gram', cost: '1')
RawInventory.create(quantity: 300, expired_at: '2018-12-01', raw: chili_flakes)
recipe_materials << RecipeMaterial.create(raw: chili_flakes, quantity: 0.005)

butter = Raw.create(name: 'Butter', type: 'dairy', measure: 'gram', cost: '0.5')
RawInventory.create(quantity: 200, expired_at: '2018-12-01', raw: butter)
recipe_materials << RecipeMaterial.create(raw: butter, quantity: 0.03)

salt = Raw.create(name: 'Salt', type: 'miscellaneous', measure: 'gram', cost: '0.5')
RawInventory.create(quantity: 1000, expired_at: '2020-12-01', raw: salt)
recipe_materials << RecipeMaterial.create(raw: salt, quantity: 10)

recipe = Recipe.create(name: 'Shrimp and Zucchini Ribbons', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-25')

####################### Recipe 2 #######################
recipe_materials.clear # clear the array

chicken_wings = Raw.create(name: 'Chicken Wings', type: 'fresh', measure: 'kilogram', cost: '200')
RawInventory.create(quantity: 4, expired_at: '2018-12-06', raw: chicken_wings)
recipe_materials << RecipeMaterial.create(raw: chicken_wings, quantity: 0.5)

hot_sauce = Raw.create(name: 'Hot Sauce', type: 'miscellaneous', measure: 'liter', cost: '75')
RawInventory.create(quantity: 6, expired_at: '2019-07-06', raw: hot_sauce)
recipe_materials << RecipeMaterial.create(raw: hot_sauce, quantity: 0.2)

recipe = Recipe.create(name: 'Buffalo Wings', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-07-12')

####################### Recipe 3 #######################
recipe_materials.clear # clear the array

gourmet_bread = Raw.create(name: 'Gourmet Bread', type: 'fresh', measure: 'kilogram', cost: '450')
RawInventory.create(quantity: 10, expired_at: '2018-01-04', raw: gourmet_bread)
recipe_materials << RecipeMaterial.create(raw: gourmet_bread, quantity: 0.2)

garlic = Raw.create(name: 'Garlic', type: 'fresh', measure: 'gram', cost: '37')
RawInventory.create(quantity: 750, expired_at: '2019-07-06', raw: garlic)
recipe_materials << RecipeMaterial.create(raw: garlic, quantity: 12)

recipe = Recipe.create(name: 'Garlic Bread', quantity: '275', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-03-11')

####################### Recipe 4 #######################
recipe_materials.clear # clear the array

spaghetti = Raw.create(name: 'Spaghetti', type: 'miscellaneous', measure: 'gram', cost: '560')
RawInventory.create(quantity: 750, expired_at: '2018-08-10', raw: spaghetti)
recipe_materials << RecipeMaterial.create(raw: spaghetti, quantity: 100)

tomato_sauce = Raw.create(name: 'Tomato Sauce', type: 'fresh', measure: 'liter', cost: '470')
RawInventory.create(quantity: 2.5, expired_at: '2018-07-06', raw: tomato_sauce)
recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.3)

recipe = Recipe.create(name: 'Spaghetti Pasta', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-04-07')

####################### Recipe 5 #######################
recipe_materials.clear # clear the array

loaf_bread = Raw.create(name: 'Loaf of Bread', type: 'miscellaneous', measure: 'gram', cost: '250')
RawInventory.create(quantity: 1000, expired_at: '2018-08-10', raw: loaf_bread)
recipe_materials << RecipeMaterial.create(raw: loaf_bread, quantity: 125)

manchego_cheese = Raw.create(name: 'Manchego Cheese', type: 'fresh', measure: 'gram', cost: '650')
RawInventory.create(quantity: 750, expired_at: '2018-03-12', raw: manchego_cheese)
recipe_materials << RecipeMaterial.create(raw: manchego_cheese, quantity: 75)

ham = Raw.create(name: 'Ham', type: 'fresh', measure: 'gram', cost: '750')
RawInventory.create(quantity: 850, expired_at: '2018-04-11', raw: ham)
recipe_materials << RecipeMaterial.create(raw: ham, quantity: 75)

recipe = Recipe.create(name: 'Ham and Cheese Sandwich', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-06-12')

####################### Recipe 6 #######################
recipe_materials.clear # clear the array

loaf_bread_seeds = Raw.create(name: 'Loaf of Bread with Seeds', type: 'miscellaneous', measure: 'gram', cost: '550')
RawInventory.create(quantity: 1000, expired_at: '2018-08-10', raw: loaf_bread_seeds)
recipe_materials << RecipeMaterial.create(raw: loaf_bread_seeds, quantity: 125)

recipe_materials << RecipeMaterial.create(raw: manchego_cheese, quantity: 75)

recipe_materials << RecipeMaterial.create(raw: ham, quantity: 75)

recipe = Recipe.create(name: 'Ham and Cheese Sandwich with seeds', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-06-12')

####################### Recipe 7 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: loaf_bread, quantity: 125)

bacon = Raw.create(name: 'Bacon', type: 'fresh', measure: 'gram', cost: '320')
RawInventory.create(quantity: 610, expired_at: '2018-04-02', raw: bacon)
recipe_materials << RecipeMaterial.create(raw: bacon, quantity: 125)

lettuce = Raw.create(name: 'Lettuce', type: 'fresh', measure: 'gram', cost: '150')
RawInventory.create(quantity: 550, expired_at: '2018-05-01', raw: lettuce)
recipe_materials << RecipeMaterial.create(raw: lettuce, quantity: 125)

tomato = Raw.create(name: 'Tomato', type: 'fresh', measure: 'gram', cost: '250')
RawInventory.create(quantity: 340, expired_at: '2018-08-11', raw: tomato)
recipe_materials << RecipeMaterial.create(raw: tomato, quantity: 125)

recipe = Recipe.create(name: 'BLT', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-04-10')

####################### Recipe 8 #######################
recipe_materials.clear # clear the array

cereal = Raw.create(name: 'Cereal', type: 'miscellaneous', measure: 'gram', cost: '200')
RawInventory.create(quantity: 450, expired_at: '2018-10-03', raw: cereal)
recipe_materials << RecipeMaterial.create(raw: cereal, quantity: 100)

milk = Raw.create(name: 'Milk', type: 'dairy', measure: 'liter', cost: '340')
RawInventory.create(quantity: 4, expired_at: '2019-07-06', raw: milk)
recipe_materials << RecipeMaterial.create(raw: milk, quantity: 0.6)

recipe = Recipe.create(name: 'Cereal with Milk', quantity: '120', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2019-10-07')

####################### Recipe 9 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: spaghetti, quantity: 100)

tomato_sauce_chili = Raw.create(name: 'Tomato Sauce Spicy', type: 'fresh', measure: 'liter', cost: '490')
RawInventory.create(quantity: 2.5, expired_at: '2018-07-06', raw: tomato_sauce_chili)
recipe_materials << RecipeMaterial.create(raw: tomato_sauce_chili, quantity: 0.3)

recipe = Recipe.create(name: 'Spaghetti Pasta Spicy', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-04-07')

####################### Recipe 10 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: spaghetti, quantity: 100)

salsa_carbonara = Raw.create(name: 'Salsa Carbonara', type: 'fresh', measure: 'liter', cost: '490')
RawInventory.create(quantity: 2.5, expired_at: '2018-04-12', raw: salsa_carbonara)
recipe_materials << RecipeMaterial.create(raw: salsa_carbonara, quantity: 0.3)

recipe = Recipe.create(name: 'Spaghetti Carbonara', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-08-12')

####################### Recipe 11 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: spaghetti, quantity: 100)

salsa_arrabiata = Raw.create(name: 'Salsa Arrabiata', type: 'fresh', measure: 'liter', cost: '500')
RawInventory.create(quantity: 2.5, expired_at: '2019-05-02', raw: salsa_arrabiata)
recipe_materials << RecipeMaterial.create(raw: salsa_arrabiata, quantity: 0.3)

recipe = Recipe.create(name: 'Spaghetti Arrabiata', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2019-01-01')

####################### Recipe 12 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: spaghetti, quantity: 100)

alfredo_sauce = Raw.create(name: 'Alfredo Sauce', type: 'fresh', measure: 'liter', cost: '420')
RawInventory.create(quantity: 2.5, expired_at: '2018-07-06', raw: alfredo_sauce)
recipe_materials << RecipeMaterial.create(raw: alfredo_sauce, quantity: 0.3)

recipe = Recipe.create(name: 'Spaghetti Alfredo', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2019-04-07')

####################### Recipe 13 #######################
recipe_materials.clear # clear the array

pizza_dough = Raw.create(name: 'Pizza Dough', type: 'miscellaneous', measure: 'gram', cost: '860')
RawInventory.create(quantity: 1000, expired_at: '2019-04-06', raw: pizza_dough)
recipe_materials << RecipeMaterial.create(raw: pizza_dough, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.65)

recipe = Recipe.create(name: 'Pizza with sauce', quantity: '450', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-06-10')

####################### Recipe 14 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: pizza_dough, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.65)

pepperoni = Raw.create(name: 'Pepperoni', type: 'meat', measure: 'gram', cost: '350')
RawInventory.create(quantity: 500, expired_at: '2019-02-04', raw: pepperoni)
recipe_materials << RecipeMaterial.create(raw: pepperoni, quantity: 175)

recipe = Recipe.create(name: 'Pepperoni Pizza', quantity: '450', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-03-10')

####################### Recipe 15 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: pizza_dough, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.65)

mozzarella = Raw.create(name: 'Mozarella', type: 'fresh', measure: 'gram', cost: '950')
RawInventory.create(quantity: 800, expired_at: '2018-10-10', raw: mozzarella)
recipe_materials << RecipeMaterial.create(raw: mozzarella, quantity: 125)

recipe = Recipe.create(name: 'Margherita Pizza', quantity: '450', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-12')

####################### Recipe 16 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: pizza_dough, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.65)

recipe_materials << RecipeMaterial.create(raw: mozzarella, quantity: 125)

recipe_materials << RecipeMaterial.create(raw: pepperoni, quantity: 175)

recipe = Recipe.create(name: 'Pizza Margherita with pepperoni', quantity: '450', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-10')

####################### Recipe 17 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: pizza_dough, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: tomato_sauce, quantity: 0.65)

recipe_materials << RecipeMaterial.create(raw: mozzarella, quantity: 125)

recipe_materials << RecipeMaterial.create(raw: pepperoni, quantity: 175)

recipe_materials << RecipeMaterial.create(raw: chili_flakes, quantity: 0.005)

recipe = Recipe.create(name: 'Pizza Margherita with pepperoni and Chili', quantity: '450', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-10')

####################### Recipe 18 #######################
recipe_materials.clear # clear the array

tortillas = Raw.create(name: 'Tortillas', type: 'miscellaneous', measure: 'kilogram', cost: '100')
RawInventory.create(quantity: 2, expired_at: '2019-10-03', raw: tortillas)
recipe_materials << RecipeMaterial.create(raw: tortillas, quantity: 0.025)

carne_pastor = Raw.create(name: 'Carne al pastor', type: 'meat', measure: 'gram', cost: '440')
RawInventory.create(quantity: 650, expired_at: '2019-07-06', raw: carne_pastor)
recipe_materials << RecipeMaterial.create(raw: carne_pastor, quantity: 85)

recipe_materials << RecipeMaterial.create(raw: salt, quantity: 5)

recipe_materials << RecipeMaterial.create(raw: lemon, quantity: 1)

recipe = Recipe.create(name: 'Tacos al Pastor', quantity: '130', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-12-12')

####################### Recipe 19 #######################
recipe_materials.clear # clear the array

recipe_materials << RecipeMaterial.create(raw: tortillas, quantity: 0.025)

recipe_materials << RecipeMaterial.create(raw: salt, quantity: 5)

recipe_materials << RecipeMaterial.create(raw: lemon, quantity: 1)

carne_bistec = Raw.create(name: 'Carne bistec', type: 'meat', measure: 'gram', cost: '540')
RawInventory.create(quantity: 650, expired_at: '2019-07-06', raw: carne_bistec)
recipe_materials << RecipeMaterial.create(raw: carne_bistec, quantity: 85)

recipe = Recipe.create(name: 'Tacos de Bistec', quantity: '130', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-11-11')

####################### Recipe 20 #######################
recipe_materials.clear # clear the array

flour = Raw.create(name: 'Flour', type: 'miscellaneous', measure: 'kilogram', cost: '200')
RawInventory.create(quantity: 6, expired_at: '2018-05-01', raw: flour)
recipe_materials << RecipeMaterial.create(raw: flour, quantity: 0.3)

recipe_materials << RecipeMaterial.create(raw: salt, quantity: 15)

recipe_materials << RecipeMaterial.create(raw: butter, quantity: 80)

egg = Raw.create(name: 'Egg', type: 'fresh', measure: 'unit', cost: '10')
RawInventory.create(quantity: 12, expired_at: '2018-05-02', raw: egg)
recipe_materials << RecipeMaterial.create(raw: egg, quantity: 2)

recipe_materials << RecipeMaterial.create(raw: milk, quantity: 0.75)

vanilla = Raw.create(name: 'Vanilla', type: 'meat', measure: 'mililiters', cost: '450')
RawInventory.create(quantity: 450, expired_at: '2018-05-01', raw: shrimp)
recipe_materials << RecipeMaterial.create(raw: shrimp, quantity: 135)

chocolate_chips = Raw.create(name: 'Chocolate Chips', type: 'fresh', measure: 'gram', cost: '1')
RawInventory.create(quantity: 300, expired_at: '2018-12-01', raw: chocolate_chips)
recipe_materials << RecipeMaterial.create(raw: chocolate_chips, quantity: 0.05)

recipe = Recipe.create(name: 'Chocolate chip cookies', quantity: '250', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-25')
