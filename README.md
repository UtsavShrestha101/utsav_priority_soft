
# Utsav Priority Soft

This project aims to assess problem-solving abilities, code quality, structure, maintainability, and proper integration with backend services.


## Documentation

This project has been developed using Flutter version 3.19.6 using bloc architecture pattern. We have used the bloc: ^8.1.4 package for state management and hive: ^2.2.3 for local storage using Hive database. Moreover, we have used the awesome_notifications: ^0.9.3+1 package for push notifications. The backend of our app is powered by Firebase.

## Firebase firestore data schemas and collection

There are 3 collection used in the app which are:
- Order
- Reviews
- Shoes

### Shoes collection
This is a collection of products that will be displayed to the users. The fields it contains are:
- gender
- itemAssets
- noOfReview
- productId
- productName
- productPrice
- description
- createdAt
- category
- averageRating

### Reviews collection
This is a hardcoded collection of user reviews stored in the server. The fields it contains are:
- avatar
- createdAt
- noOfReview
- rating
- userName
- review

### Order collection
This is a record of the orders that the user has placed. The fields it contains are:
- createdAt
- orderItem 
    - product
    - quantity
    - size
    - color

#### In order to obtain a persistent user ID, I have implemented the use of two packages in my Flutter application. Firstly, I have used the 'flutter_udid: ^3.0.0' package to retrieve a unique identifier for each device that the application is installed on. Secondly, I have utilized the 'uuid: ^4.4.0' package to generate a unique identifier for each order placed within the application. This ID is then associated with a unique user ID, which is obtained from the 'flutter_udid' package. Finally, each order is stored as a separate document in the 'myOrders' collection, with its own unique identifier. This scheme ensures that each order can be easily identified and tracked within the application.

## Features
A UtsavPriority Soft app built with BLOC pattern. It has following features
- Notification service
- Add to cart
- Local storage
- Product filter based on price range, highest review, lowest price, latest, gender and category
- View reviews with pagination
- Runs on both Android & IOS.







## Screenshots

- ### Home Page
![1](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/ab59c88b-0387-4433-b941-9fae1083f1be)
- ### Filter Page
![2](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/5913d246-b6ad-4030-bf0c-dbe6dc95f1dc)
- ### Product Detail Page
![3](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/f4bae0c4-7f0a-45a9-be0a-4c760520d76b)
- ### Review Page
![4](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/7c407453-8fe2-494d-8736-27060637ad63)
- ### Cart Page
![5](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/32a831cb-b283-4dce-a846-892557c83f32)
![6](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/e88b0aa1-64e8-414a-830b-cc83a58c5195)
- ### Order Summary
![7](https://github.com/UtsavShrestha101/utsav_priority_soft/assets/70084913/13dd534d-eecd-4d9f-89fc-040757555680)

