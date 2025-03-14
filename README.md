# Project Setup

## Getting Started
Follow these steps to set up and run the project.

### 1. Clone the Repository

### 2. Open in Xcode
- Navigate to the project directory.
- Open the `.xcodeproj` file in Xcode.

### 3. Run the Project
- Click the **Run** button in Xcode.
- Wait for the simulator or (preferably) connected device to load the app.

### 4. Sign In
- Open the app in the simulator or on a real device.
- Click **Sign In** to authenticate.

### 5. Send a Test Request
Run the following cURL command to send a test notification:
```sh
curl --location 'https://api.courier.com/send' \
--header 'Content-Type: application/json' \
--header 'Authorization: pk_prod_5P5F7BGVCS4ZGMPME0194KVSP1G7' \
--data '{
    "message": {
        "to": {
            "user_id": "test_user"
        },
        "content": {
            "title": "Test",
            "body": "Message"
        },
        "routing": {
            "method": "all",
            "channels": [
                "apn"
            ]
        }
    }
}'
```

