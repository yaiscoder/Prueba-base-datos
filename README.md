# Prueba-base-datos

## Project description.


## Technologies used.


## Database engine used.


## Explanation of normalization process.
1NF is already satisfied, as the initial dataset contains a single value in each cell; the model has now evolved to 2NF, resulting in seven entities with their respective attributes.

The "Supplier" entity includes an ID, a name, and the ID of the city where the supplier is based; the "Warehouse" entity follows the same structure. It is worth noting that "City" is treated as a separate entity to maintain organization—since suppliers and warehouses share the same cities—and to simplify the process of adding new cities in the future. The "Purchase" entity tracks its own ID, the order number, the date of the transaction, and the transaction type (inbound or outbound). "Product" is also a separate entity, containing its ID, name, and the ID of its category; the category is handled separately—much like the city—to ensure organization and facilitate the future addition of new categories.

Finally, 3NF is achieved by distributing attributes as previously explained and by creating tables for many-to-many relationships, such as the one linking products and purchases.

## Database structure.


## Entity Relationship Model.


## Instructions to create the database.


## Instructions to load data.


## Explanation of each SQL query.


## Developer information:
- Full name: Yaila Ustate
- Clan: Garabato
