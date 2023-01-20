# Meazure Learning Coding Challenge

This is the coding challenge of the Meazure Learning, one of the steps of the hiring process.

This test had a time limit and was made in a 4 hours time window.

### Technologies
 - Ruby Version 3.0.0
 - Rails Version 7.0.x
 - Rspec 6.0.1

## How to test it?

- [ ] Run the application `rails s`
- [ ] Feed the database with some examples.
- [ ] Call the created endpoint by using testing apps, such as postman.

Endpoint:

`POST <host>/web_api/v1/enrollment`

Request body example:
```json
{
    "first_name": "Ricardo",
    "last_name": "Costa",
    "phone_number": "999-3454",
    "college_id": "1",
    "exam_id": "2",
    "start_time": "2014-11-19 20:30:45"
}
```
