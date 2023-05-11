## Mobile iOS Engineer 


## Recipe App

The Recipe app is a project developed in MVVM architecture with three main modules: Home, Details and LocationMap. The key features of each module are described below:

<img src="https://github.com/heygonzalocaira/RecipeChallenge/assets/21184592/651f797c-f9a5-411e-b2aa-7aca8e90ad2d"  width="300" height="500" />

<img src="https://github.com/heygonzalocaira/RecipeChallenge/assets/21184592/3b495a7f-d9c4-4ad0-8473-671b3817733f"  width="300" height="500" />
<img src="https://github.com/heygonzalocaira/RecipeChallenge/assets/21184592/dfc50f0d-ec3d-4b7f-aed5-5275d6a73526"  width="300" height="500" />

**Modules:**
- Home: Allows filtering recipes by name, showing a list of recipes with their image, name and rating. Clicking on a recipe takes you to the Details module.
- Details: Provides detailed information about a specific recipe and contains a button that leads to the LocationMap module.
- LocationMap: Displays a map located at the coordinates of the selected recipe.

**Networking:**
Implements an extra Networking layer to work with the data coming from [mockable.io](https://www.mockable.io/).Uses the APIService class to interact with the data.

**Testing:**
Networking layer tests are included to ensure the integrity of the received data.
The tests verify the correct reception and handling of data, as well as the handling of cases where data is not available.

