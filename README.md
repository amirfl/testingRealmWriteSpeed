# Testing Realm Write Speed

Realm is a mobile database replacing the need for SQLite & Core Data. [Learn More at Realm.io](http://www.realm.io)

## This little OSX program compares write speeds between:
* Writing one object at a time into a realm.
* Writing all objects at once from an array into a realm.

Testing on my Macbook Pro showed that **adding all objects at once is about x416 faster then one at a time**.
