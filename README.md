README.MD

## Identification of the problem you are trying to slove by building this particular markeyplace app
The issue is that there are millions of unwanted garments laying around in everyone's closet. Purchasing secondhand clothing has numerous advantages that extend far beyond your own wardrobe.
It not only allows you to locate unique goods, experiment with your distinctive style, and uncover fantastic deals, but it also encourages a more sustainable and circular future for the fashion industry.

## Why is it a problem that needs solving
With thousands of unwanted clothes, this marketplace can alleviate that problem while also providing an opportunity to earn extra money.
Selling secondhand clothing is beneficial to the environment since it lowers waste and keeps stuff out of landfills. When you sell your clothes online, someone else can use them while lowering their carbon footprint.


##
https://github.com/ChanraSvay/Marketplace

##
https://staging-marketplaces.herokuapp.com

## Purpose
In the average home, 50% of the clothes remain unworn. We accumulate clothes when they are on sale and then discard them.
Clothes will be a marketplace for both new and worn undesired clothing. It will be a simple marketplace for anyone wishing to get rid of unwanted clothing while earning money.

## Functionality/ features

- User can go the landing page (website)
- They will be prompt to sign in or sign up to access the products
- Once sign in they can view products that are currently listed
- User can add new products to the listing page and also edit and delete.
- Users purchase a product of their choice

## Sitmap
[Sitemap](https://ibb.co/NYr766H)

## Target audience
- All genders.
- For anyone who wants to make some extra money for clothes they have no used for


## Tech stack
- Ruby on rails -
- Postgresql
- Ruby 
- HTML 
- CSS 
- Heroku 
- Bootstrap 
- Devise 

## User stories
### Account holder
- I need to know I have a secure account so that my personal information is safe
- I can update my products and buy products
### A customer
- I can search for products on the application
- To view to products that is listed
- To buy products
### A seller
- I can post products that I want to sell
- To edit and delete my product items
- To see what items are sold

## Wireframe
[Wireframe Landing Page](https://ibb.co/17YgMxw)

[Wireframe Sign Up](https://ibb.co/2MnrRQf)

[Wireframe Login](https://ibb.co/1QhjKhy)

[Wireframe Dashboard](https://ibb.co/hB59y0h)

[Wireframe Add product](https://ibb.co/ch9q6rx)

[Wireframe Buy product](https://ibb.co/DQfZVyQ)
## ERD
[ERD](https://ibb.co/94rNmsr)

## Explain the different high-level components (abstractions) in your app

- The landing page will display the front page. The user needs to be sign in or sign up to access the views page
- Once you are signed in you are them taken to the view page
- You can create a new listing products or buy a product from another user
- Can also edit and delete if you user change their minds

## Details any third services that your app will use
- Heroku - for web hosting
- Devise - for handling user authentication 
- Bootstrap - Rails gems for styling

## Describe your projects model in term of relationship

```
Users
has_many :products
has_many :sold_orders
has_many :brought_orders

Products
belongs_to :user
belongs_to :category
has_rich_text :description
has_one_attached :picture

Orders
belongs_to :product
belongs_to :seller 
belongs_to :buyer

```
## Discuss the database relations to be implement in your app
 The user needs to be created and active to be able to use the features.
 They will then be able to create any product to be listed with the user. Once the products are listed they then either sell the products or buy a product from other users.
 They can either edit or delete any listing of their choice only if that listing is belong to them.

## Provide your database chema design 
```
create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "buyer_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
  end

  create_table "pay_charges", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "subscription_id"
    t.string "processor_id", null: false
    t.integer "amount", null: false
    t.string "currency"
    t.integer "application_fee_amount"
    t.integer "amount_refunded"
    t.jsonb "metadata"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id", "processor_id"], name: "index_pay_charges_on_customer_id_and_processor_id", unique: true
    t.index ["subscription_id"], name: "index_pay_charges_on_subscription_id"
  end

  create_table "pay_customers", force: :cascade do |t|
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "processor", null: false
    t.string "processor_id"
    t.boolean "default"
    t.jsonb "data"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id", "deleted_at", "default"], name: "pay_customer_owner_index"
    t.index ["processor", "processor_id"], name: "index_pay_customers_on_processor_and_processor_id", unique: true
  end

  create_table "pay_merchants", force: :cascade do |t|
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "processor", null: false
    t.string "processor_id"
    t.boolean "default"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id", "processor"], name: "index_pay_merchants_on_owner_type_and_owner_id_and_processor"
  end

  create_table "pay_payment_methods", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "processor_id", null: false
    t.boolean "default"
    t.string "type"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id", "processor_id"], name: "index_pay_payment_methods_on_customer_id_and_processor_id", unique: true
  end

  create_table "pay_subscriptions", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "name", null: false
    t.string "processor_id", null: false
    t.string "processor_plan", null: false
    t.integer "quantity", default: 1, null: false
    t.string "status", null: false
    t.datetime "trial_ends_at"
    t.datetime "ends_at"
    t.decimal "application_fee_percent", precision: 8, scale: 2
    t.jsonb "metadata"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id", "processor_id"], name: "index_pay_subscriptions_on_customer_id_and_processor_id", unique: true
  end

  create_table "pay_webhooks", force: :cascade do |t|
    t.string "processor"
    t.string "event_type"
    t.jsonb "event"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "condition"
    t.boolean "sold", default: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "orders", "users", column: "seller_id"
  add_foreign_key "pay_charges", "pay_customers", column: "customer_id"
  add_foreign_key "pay_charges", "pay_subscriptions", column: "subscription_id"
  add_foreign_key "pay_payment_methods", "pay_customers", column: "customer_id"
  add_foreign_key "pay_subscriptions", "pay_customers", column: "customer_id"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
end

```

## Describe the way tasks are allocated and tracked in your project
[Trello Board](https://ibb.co/vQpWBh9)
