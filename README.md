# Tea Take Home

The Take Home Challenge is a project that mimics a typical interview task, this project involves developing an API that manages tea subscriptions. Key features include the ability to create a subscription for a customer, cancel a subscription by setting its status to inactive, and retrieve all subscriptions (both active and cancelled) for a specific customer.

## Setup
This project uses ruby 3.2.2 and rails 7.1.3. RSpec for testing.

After forking and cloning run the following commands in your terminal:
`bundle install`
`rails db:create,migrate`
`bundle exec rspec`
You should see 29 passing tests.

## Endpoints
Here are examples on how the requests should look like,

### Create a customer:
`POST '/api/v0/customers' `
- body:
```
{
  "first_name": "Selena",
  "last_name": "H ",
  "email": "selena@example.com",
  "address": "000 Whatever St."
}
```
- Return :
```
{
    "id": 3,
    "first_name": "Selena",
    "last_name": "H ",
    "email": "selena@example.com",
    "address": "000 Whatever St.",
    "created_at": "2024-05-03T19:57:18.562Z",
    "updated_at": "2024-05-03T19:57:18.562Z"
}
```

### Create a subscription:
` POST '/api/v0/customers/:customer_id/subscriptions' `

- body:
```
{
  "tea_id": "2",
  "customer_id": "3",
  "price": "15.99",
  "frequency": "monthly",
  "status": "active",
  "title": "Best Tea Plan"
}
```

- Return:
```
{
    "data": {
        "id": "8",
        "type": "subscription",
        "attributes": {
            "title": "Best Tea Plan",
            "price": "15.99",
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```
### List the subscriptions for a customer:
` GET '/api/v0/customers/3' ` (3 is the customer id)

- Return:
```
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "first_name": "Selena",
            "last_name": "H ",
            "email": "selena@example.com",
            "address": "000 Whatever St.",
            "subscriptions": [
                {
                    "data": {
                        "id": "8",
                        "type": "subscription",
                        "attributes": {
                            "title": "Best Tea Plan",
                            "price": "15.99",
                            "status": "active",
                            "frequency": "monthly"
                        }
                    }
                }
            ]
        }
    }
}
```
### Cancel a subscription:
` PATCH '/api/v0/customers/3/subscriptions/8' ` (3 is customer id and 8 is subscription id)
- body:
```
{
 "status": "cancelled"
}
```

- Return:
```
{
    "message": "Subscription Cancelled"
}
```
And when checking back use the request to list the subscriptions for a customer and you will get this :
- Return:

```
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "first_name": "Selena",
            "last_name": "H ",
            "email": "selena@example.com",
            "address": "000 Whatever St.",
            "subscriptions": [
                {
                    "data": {
                        "id": "8",
                        "type": "subscription",
                        "attributes": {
                            "title": "Best Tea Plan",
                            "price": "15.99",
                            "status": "cancelled",
                            "frequency": "monthly"
                        }
                    }
                }
            ]
        }
    }
}
```
