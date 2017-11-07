# DB設計

## users table

| Column     | Type        | Options                                |
|------------|-------------|----------------------------------------|
| nickname   | string      | null: false, index: true, unique: true |
| mail       | string      | null: false, unique: true              |
| password   | string      | null: false                            |
| screenName | string      | null: false, unique: true, limit: 10   |
| intro      | text        |                                        |
| avatar     | string      |                                        |
### Association
 - has_many :
 - has_many :


## products table

| Column      | Type        | Options                                     |
|-------------|-------------|---------------------------------------------|
| productName | string      |limit:420, null:false,index:true, unique:true|
| productImage| string      |                                             |
| dominant    | string      |                                             |

### Association
 - has_many : reviews
 - has_many : attributions


## reviews table

| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| product_id   | integer     | null: false, foreign_key: true |
| user_id      | integer     | null: false, foreign_key: true |
| review       | text        | null: false                    |
| reviewImage  | string      |                                |

### Association
 - belongs_to : product
 - belongs_to : user


<!-- ===============上まで、一旦必須============= -->
## Attribution table
| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| user_id      | integer     | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |
### Association
 - belongs_to : product

## images table
| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| images       | string      | null: false, foreign_key: true |
| product_id   | integer     | null: false, foreign_key: true |

### Association
 - belongs_to : product

<!-- =============多分いる============== -->
## ProductScore table
| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| product_id   | integer     | null: false, foreign_key: true |
| user_id      | integer     | null: false, foreign_key: true |
| score        | integer     | null: false                    |
| recommend    | boolean     | null: false                    |

### Association
 - belongs_to : product

## ReviewtScore table
| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| product_id   | integer     | null: false, foreign_key: true |
| user_id      | integer     | null: false, foreign_key: true |
| score        | integer     | null: false                    |
| recommend    | boolean     | null: false                    |

### Association
 - belongs_to : product













