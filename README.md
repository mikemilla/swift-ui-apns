# This is a barebones & fully functional push notification setup in a SwiftUI app.

## Getting Started

### 1. Clone the Repository

### 2. Open in Xcode
- Navigate to the project directory.
- Open the `.xcodeproj` file in Xcode.

### 3. Run the Project
- Click the **Run** button in Xcode.
- Wait for the simulator or (preferably) connected device to load the app.

### 4. Sign In and Sync Tokens
- Click **Sign In** to authenticate.
- Allow notification permissions

### 5. Send a Test Request
Run the following cURL command to send a test notification:
```sh
curl --location 'https://api.courier.com/send' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer pk_prod_5P5F7BGVCS4ZGMPME0194KVSP1G7' \
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

