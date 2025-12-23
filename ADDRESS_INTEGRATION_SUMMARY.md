# Address Feature - Full API Integration Summary

## Overview
This document summarizes the complete integration of the Address feature APIs with the Flutter application, following clean architecture principles with BLoC pattern.

## API Endpoints Integrated

### Base URL
```
https://fashion-eta-rosy.vercel.app/api/
```

### Endpoints
1. **GET** `/addresses` - Get all user addresses
2. **GET** `/addresses/{id}` - Get single address by ID
3. **POST** `/addresses` - Create new address
4. **PATCH** `/addresses/{id}` - Update address
5. **DELETE** `/addresses/{id}` - Delete address

All endpoints require authentication via Bearer token.

## Architecture

### 📁 Project Structure
```
lib/
├── core/
│   ├── services/
│   │   ├── api_services.dart (✅ Already exists)
│   │   ├── endpoints.dart (✅ Updated)
│   │   └── locator.dart (✅ Updated)
│   └── router/
│       └── go_router_config.dart (✅ Updated)
├── features/
    └── addresses/
        ├── data/
        │   ├── model/
        │   │   └── address_model.dart (✅ Updated)
        │   └── repo/
        │       └── address_repo.dart (✅ Created)
        ├── logic/
        │   ├── address_cubit.dart (✅ Created)
        │   └── address_state.dart (✅ Created)
        └── ui/
            ├── get_addresses_view.dart (✅ Updated)
            ├── create_address_view.dart (✅ Updated)
            ├── update_address_view.dart (✅ Updated)
            └── widgets/
                └── address_card_widget.dart (✅ Updated)
```

## Files Created/Updated

### 1. Data Layer

#### `address_model.dart` - Updated
- Updated model to match API response structure
- Added fields: `id`, `name`, `phone`, `city`, `governorate`, `street`, `notes`, `createdAt`, `updatedAt`
- Removed old fields: `username`, `phoneNumber`, `state`, `zipCode`
- Added `fromJson()` factory method
- Added `toJson()` method
- Added `copyWith()` method

#### `address_repo.dart` - Created
- Abstract repository interface
- Implementation with 5 methods:
  - `getAddresses()` - Fetch all addresses
  - `getAddressById()` - Fetch single address
  - `createAddress()` - Create new address
  - `updateAddress()` - Update existing address
  - `deleteAddress()` - Delete address
- All methods return `Either` type for error handling

### 2. Business Logic Layer

#### `address_state.dart` - Created
States:
- `AddressInitial` - Initial state
- `AddressLoading` - Loading addresses list
- `AddressActionLoading` - Loading during create/update/delete
- `AddressLoaded` - Addresses successfully loaded
- `AddressSingleLoaded` - Single address loaded
- `AddressActionSuccess` - Action completed successfully
- `AddressError` - Error occurred

#### `address_cubit.dart` - Created
Methods:
- `getAddresses()` - Fetch all addresses
- `getAddressById(String id)` - Fetch single address
- `createAddress(AddressModel address)` - Create new address
- `updateAddress(String id, AddressModel address)` - Update address
- `deleteAddress(String id)` - Delete address

Features:
- Local caching of addresses list
- Automatic list updates after create/update/delete
- Error handling with user-friendly messages
- Success messages for actions

### 3. Presentation Layer

#### `get_addresses_view.dart` - Updated
Features:
- BlocProvider integration
- Loading state with CircularProgressIndicator
- Error state with error message display
- Empty state when no addresses
- List of addresses with ListView.separated
- Pull-to-refresh capability
- FloatingActionButton to add new address

#### `create_address_view.dart` - Updated
Features:
- Form with validation
- Fields: Name, Phone, Street, City, Governorate, Notes (optional)
- BlocListener for success/error feedback
- SnackBar notifications
- Loading state on button
- Auto-navigation back on success

#### `update_address_view.dart` - Updated
Features:
- Pre-filled form with existing data
- Form validation
- BlocListener for success/error feedback
- SnackBar notifications
- Loading state on button
- Auto-navigation back on success

#### `address_card_widget.dart` - Updated
Features:
- Display name, phone, full address
- Display notes if available
- Edit button (navigates to edit screen)
- Delete button (shows confirmation dialog)
- Select button (for checkout)
- Beautiful card UI with shadows

### 4. Dependency Injection

#### `locator.dart` - Updated
Registered:
- `AddressRepoImp` - Repository implementation
- `AddressCubit` - Cubit instance

#### `endpoints.dart` - Updated
Added:
- `addressesEP = "addresses"`

### 5. Router Configuration

#### `go_router_config.dart` - Updated
- Updated `editAddressView` route to accept `AddressModel` as extra parameter
- Added import for `AddressModel`

## API Request/Response Examples

### 1. Create Address
**Request:**
```json
POST /api/addresses
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "Mohamed Maher",
  "phone": "01012345678",
  "city": "Cairo",
  "governorate": "Cairo",
  "street": "Tahrir Street",
  "notes": "Near metro station"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "_id": "694b1d700e6547b7f24194d5",
    "name": "Mohamed Maher",
    "phone": "01012345678",
    "city": "Cairo",
    "governorate": "Cairo",
    "street": "Tahrir Street",
    "notes": "Near metro station",
    "createdAt": "2025-12-23T22:53:36.219Z",
    "updatedAt": "2025-12-23T22:53:36.219Z",
    "__v": 0
  }
}
```

### 2. Get All Addresses
**Request:**
```
GET /api/addresses
Authorization: Bearer {token}
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "_id": "694b1d700e6547b7f24194d5",
      "name": "Mohamed Maher",
      "phone": "01012345678",
      "city": "Cairo",
      "governorate": "Cairo",
      "street": "Tahrir Street",
      "notes": "Near metro station",
      "createdAt": "2025-12-23T22:53:36.219Z",
      "updatedAt": "2025-12-23T22:53:36.219Z",
      "__v": 0
    }
  ]
}
```

### 3. Update Address
**Request:**
```json
PATCH /api/addresses/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "Mohamed Maher Updated"
}
```

### 4. Delete Address
**Request:**
```
DELETE /api/addresses/{id}
Authorization: Bearer {token}
```

## Key Features Implemented

### ✅ Complete CRUD Operations
- ✅ Create new address
- ✅ Read all addresses
- ✅ Read single address
- ✅ Update existing address
- ✅ Delete address

### ✅ State Management
- ✅ BLoC pattern with Cubit
- ✅ Loading states
- ✅ Error handling
- ✅ Success feedback

### ✅ UI/UX Features
- ✅ Form validation
- ✅ Loading indicators
- ✅ Error messages
- ✅ Success notifications
- ✅ Empty state handling
- ✅ Confirmation dialogs
- ✅ Beautiful card design

### ✅ Data Flow
- ✅ API → Repository → Cubit → UI
- ✅ Proper error handling at each layer
- ✅ Type-safe data models
- ✅ Local caching

## Testing the Integration

1. **Start the app:**
   ```bash
   flutter run
   ```

2. **Test scenarios:**
   - Navigate to "My Addresses" screen
   - View list of addresses (or empty state)
   - Tap "+" button to add new address
   - Fill form and submit
   - See success message and updated list
   - Tap "Edit" on an address
   - Update information and save
   - Tap "Delete" and confirm
   - See updated list

## Authentication
All API calls use Bearer token authentication, which is automatically handled by the `AuthInterceptor` in `api_services.dart`. The token is retrieved from local storage using the `LocalDBService`.

## Error Handling
- Network errors are caught by `ApiErrorHandler`
- User-friendly error messages are shown via SnackBar
- Failed operations don't break the app
- Loading states prevent duplicate requests

## Next Steps (Optional Enhancements)

1. **Add pull-to-refresh** on addresses list
2. **Add search/filter** functionality
3. **Set default address** functionality
4. **Address validation** (e.g., phone number format)
5. **Offline support** with local database
6. **Address suggestions** using Google Places API
7. **Map integration** for address selection

## Notes

- All code follows the existing project architecture
- Uses the same patterns as other features (auth, cart, etc.)
- Properly formatted with `dart format`
- No compile errors
- Ready for testing and production use

---

**Integration completed successfully! 🎉**
