# Testing Realm Write Speed

Realm is a mobile database replacing the need for SQLite & Core Data. [Learn More at Realm.io](http://www.realm.io)

Compares write speeds between:
*Adding one object at a time to realm
*Adding all objects at once from an array.

Testing on my Macbook Pro showed that **adding all objects at once is about x416 faster then one at a time**
