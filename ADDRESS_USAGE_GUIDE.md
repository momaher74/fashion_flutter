# Address Feature - Quick Usage Guide

## For Developers

### How to Use the Address Feature in Your Code

#### 1. Display List of Addresses
```dart
// In your widget
BlocProvider(
  create: (context) => getIt<AddressCubit>()..getAddresses(),
  child: BlocBuilder<AddressCubit, AddressState>(
    builder: (context, state) {
      if (state is AddressLoading) {
        return CircularProgressIndicator();
      }
      if (state is AddressLoaded) {
        return ListView.builder(
          itemCount: state.addresses.length,
          itemBuilder: (context, index) {
            final address = state.addresses[index];
            return Text('${address.name} - ${address.city}');
          },
        );
      }
      return SizedBox();
    },
  ),
)
```

#### 2. Create New Address
```dart
final address = AddressModel(
  name: 'John Doe',
  phone: '01234567890',
  street: 'Main Street',
  city: 'Cairo',
  governorate: 'Cairo',
  notes: 'Optional notes',
);

context.read<AddressCubit>().createAddress(address);
```

#### 3. Update Address
```dart
final updatedAddress = existingAddress.copyWith(
  name: 'New Name',
  phone: 'New Phone',
);

context.read<AddressCubit>().updateAddress(
  addressId,
  updatedAddress,
);
```

#### 4. Delete Address
```dart
context.read<AddressCubit>().deleteAddress(addressId);
```

#### 5. Get Single Address
```dart
context.read<AddressCubit>().getAddressById('address_id_here');

// Listen for result
BlocListener<AddressCubit, AddressState>(
  listener: (context, state) {
    if (state is AddressSingleLoaded) {
      print('Address: ${state.address.name}');
    }
  },
)
```

#### 6. Listen for Actions
```dart
BlocListener<AddressCubit, AddressState>(
  listener: (context, state) {
    if (state is AddressActionSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    } else if (state is AddressError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: YourWidget(),
)
```

## For API Testing

### Using cURL

#### 1. Get All Addresses
```bash
curl --location 'http://localhost:3000/api/addresses' \
--header 'Authorization: Bearer YOUR_TOKEN_HERE'
```

#### 2. Get Single Address
```bash
curl --location 'http://localhost:3000/api/addresses/ADDRESS_ID' \
--header 'Authorization: Bearer YOUR_TOKEN_HERE'
```

#### 3. Create Address
```bash
curl --location 'http://localhost:3000/api/addresses' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer YOUR_TOKEN_HERE' \
--data '{
  "name": "Mohamed Maher",
  "phone": "01012345678",
  "city": "Cairo",
  "governorate": "Cairo",
  "street": "Tahrir Street",
  "notes": "Near metro station"
}'
```

#### 4. Update Address
```bash
curl --location --request PATCH 'http://localhost:3000/api/addresses/ADDRESS_ID' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer YOUR_TOKEN_HERE' \
--data '{
  "name": "Updated Name",
  "phone": "01098765432"
}'
```

#### 5. Delete Address
```bash
curl --location --request DELETE 'http://localhost:3000/api/addresses/ADDRESS_ID' \
--header 'Authorization: Bearer YOUR_TOKEN_HERE'
```

## Navigation

### Navigate to Addresses Screen
```dart
context.pushNamed(myAddressesView);
```

### Navigate to Add Address
```dart
context.pushNamed(addAddressView);
```

### Navigate to Edit Address
```dart
context.pushNamed(editAddressView, extra: addressModel);
```

## State Types

| State | Description | Use Case |
|-------|-------------|----------|
| `AddressInitial` | Initial state | App startup |
| `AddressLoading` | Loading addresses list | Fetching addresses |
| `AddressActionLoading` | Action in progress | Create/Update/Delete |
| `AddressLoaded` | Addresses loaded successfully | Display list |
| `AddressSingleLoaded` | Single address loaded | Display details |
| `AddressActionSuccess` | Action completed | Show success message |
| `AddressError` | Error occurred | Show error message |

## Common Patterns

### Refresh Addresses List
```dart
// After navigating back from add/edit
final result = await context.pushNamed(addAddressView);
if (result == true) {
  context.read<AddressCubit>().getAddresses();
}
```

### Handle Loading State
```dart
BlocBuilder<AddressCubit, AddressState>(
  builder: (context, state) {
    final isLoading = state is AddressActionLoading;
    return ElevatedButton(
      onPressed: isLoading ? null : () => _handleSubmit(),
      child: isLoading 
        ? CircularProgressIndicator() 
        : Text('Submit'),
    );
  },
)
```

### Show Confirmation Dialog
```dart
void _deleteAddress(String id) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete Address'),
      content: Text('Are you sure?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AddressCubit>().deleteAddress(id);
          },
          child: Text('Delete'),
        ),
      ],
    ),
  );
}
```

## Validation Example

```dart
CustomTextFormField(
  hintText: "Name",
  controller: nameController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  },
)
```

## Tips & Best Practices

1. **Always wrap with BlocProvider** when using AddressCubit
2. **Use BlocListener** for side effects (navigation, snackbars)
3. **Use BlocBuilder** for UI updates
4. **Validate forms** before submission
5. **Show loading states** during API calls
6. **Handle errors gracefully** with user-friendly messages
7. **Refresh list** after modifications
8. **Use confirmation dialogs** for destructive actions
9. **Pass complete models** through navigation extras
10. **Keep UI responsive** during operations

## Troubleshooting

### Issue: Addresses not loading
- Check if user is authenticated (token exists)
- Verify network connection
- Check API endpoint URL in `api_services.dart`
- Look for errors in console

### Issue: Create/Update fails
- Validate all required fields are filled
- Check network connection
- Verify token is valid
- Check API response in console

### Issue: Navigation not working
- Ensure route is registered in `go_router_config.dart`
- Pass correct data through `extra` parameter
- Check route names match constants

### Issue: State not updating
- Ensure BlocProvider is at correct level
- Check if emit() is being called in cubit
- Verify state conditions in builder

---

**Happy Coding! 🚀**
