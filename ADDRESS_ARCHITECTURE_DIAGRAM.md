# Address Feature - Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           PRESENTATION LAYER                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐    │
│  │ MyAddressesView  │  │ AddAddressView   │  │ EditAddressView  │    │
│  │                  │  │                  │  │                  │    │
│  │ - List all       │  │ - Create form    │  │ - Update form    │    │
│  │ - FAB to add     │  │ - Validation     │  │ - Pre-filled     │    │
│  │ - Pull refresh   │  │ - Submit         │  │ - Save changes   │    │
│  └────────┬─────────┘  └────────┬─────────┘  └────────┬─────────┘    │
│           │                     │                      │               │
│           └─────────────────────┼──────────────────────┘               │
│                                 │                                      │
│                    ┌────────────▼───────────┐                          │
│                    │  AddressCard Widget    │                          │
│                    │                        │                          │
│                    │  - Display info        │                          │
│                    │  - Edit button         │                          │
│                    │  - Delete button       │                          │
│                    │  - Select button       │                          │
│                    └────────────────────────┘                          │
│                                                                         │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
                               │ BlocProvider / BlocBuilder / BlocListener
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                         BUSINESS LOGIC LAYER                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│                    ┌────────────────────────┐                          │
│                    │    AddressCubit        │                          │
│                    ├────────────────────────┤                          │
│                    │ Methods:               │                          │
│                    │ - getAddresses()       │                          │
│                    │ - getAddressById()     │                          │
│                    │ - createAddress()      │                          │
│                    │ - updateAddress()      │                          │
│                    │ - deleteAddress()      │                          │
│                    │                        │                          │
│                    │ State Management:      │                          │
│                    │ - emit(state)          │                          │
│                    │ - Local caching        │                          │
│                    └───────────┬────────────┘                          │
│                                │                                        │
│                    ┌───────────▼────────────┐                          │
│                    │   AddressState         │                          │
│                    ├────────────────────────┤                          │
│                    │ - AddressInitial       │                          │
│                    │ - AddressLoading       │                          │
│                    │ - AddressActionLoading │                          │
│                    │ - AddressLoaded        │                          │
│                    │ - AddressSingleLoaded  │                          │
│                    │ - AddressActionSuccess │                          │
│                    │ - AddressError         │                          │
│                    └────────────────────────┘                          │
│                                                                         │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
                               │ Repository Pattern
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                              DATA LAYER                                 │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│                    ┌────────────────────────┐                          │
│                    │   AddressRepo          │                          │
│                    │   (Abstract)           │                          │
│                    └───────────┬────────────┘                          │
│                                │                                        │
│                    ┌───────────▼────────────┐                          │
│                    │  AddressRepoImp        │                          │
│                    ├────────────────────────┤                          │
│                    │ API Methods:           │                          │
│                    │ - getAddresses()       │                          │
│                    │ - getAddressById(id)   │                          │
│                    │ - createAddress(data)  │                          │
│                    │ - updateAddress(id)    │                          │
│                    │ - deleteAddress(id)    │                          │
│                    │                        │                          │
│                    │ Returns: Either<L,R>   │                          │
│                    └───────────┬────────────┘                          │
│                                │                                        │
│                    ┌───────────▼────────────┐                          │
│                    │   AddressModel         │                          │
│                    ├────────────────────────┤                          │
│                    │ Fields:                │                          │
│                    │ - id                   │                          │
│                    │ - name                 │                          │
│                    │ - phone                │                          │
│                    │ - city                 │                          │
│                    │ - governorate          │                          │
│                    │ - street               │                          │
│                    │ - notes                │                          │
│                    │ - createdAt            │                          │
│                    │ - updatedAt            │                          │
│                    │                        │                          │
│                    │ Methods:               │                          │
│                    │ - fromJson()           │                          │
│                    │ - toJson()             │                          │
│                    │ - copyWith()           │                          │
│                    └────────────────────────┘                          │
│                                                                         │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
                               │ HTTP Calls
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                          NETWORK LAYER                                  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│                    ┌────────────────────────┐                          │
│                    │    ApiServices         │                          │
│                    ├────────────────────────┤                          │
│                    │ - Dio instance         │                          │
│                    │ - AuthInterceptor      │                          │
│                    │ - request() method     │                          │
│                    │ - Error handling       │                          │
│                    └───────────┬────────────┘                          │
│                                │                                        │
│                    ┌───────────▼────────────┐                          │
│                    │      Endpoints         │                          │
│                    ├────────────────────────┤                          │
│                    │ addressesEP = "addresses"                         │
│                    └────────────────────────┘                          │
│                                                                         │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
                               │ REST API
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                          BACKEND API                                    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  Base URL: https://fashion-eta-rosy.vercel.app/api/                    │
│                                                                         │
│  Endpoints:                                                             │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │ GET    /addresses          - Get all addresses                   │  │
│  │ GET    /addresses/:id      - Get single address                  │  │
│  │ POST   /addresses          - Create new address                  │  │
│  │ PATCH  /addresses/:id      - Update address                      │  │
│  │ DELETE /addresses/:id      - Delete address                      │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                                                         │
│  Authentication: Bearer Token (Required for all endpoints)             │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘


═══════════════════════════════════════════════════════════════════════════
                            DATA FLOW DIAGRAM
═══════════════════════════════════════════════════════════════════════════

User Action (Tap Button)
         │
         ▼
    UI Widget
         │
         ▼
   BlocBuilder/BlocListener
         │
         ▼
   AddressCubit Method
         │
         ▼
   AddressRepo Method
         │
         ▼
    ApiServices.request()
         │
         ▼
   HTTP Request (Dio)
         │
         ├─────────────────┐
         │                 │
         ▼                 ▼
    Success            Error
         │                 │
         ▼                 ▼
   Parse JSON        ErrorHandler
         │                 │
         ▼                 ▼
  AddressModel       Error Message
         │                 │
         ▼                 ▼
   Update State      Emit Error State
         │                 │
         ▼                 ▼
   Emit Success      BlocListener Catches
         │                 │
         ▼                 ▼
  BlocBuilder       Show SnackBar
    Rebuilds              │
         │                 │
         ▼                 ▼
    Update UI        User Sees Error


═══════════════════════════════════════════════════════════════════════════
                      DEPENDENCY INJECTION FLOW
═══════════════════════════════════════════════════════════════════════════

main.dart
    │
    ▼
setupServiceLocator()
    │
    ├─► LocalDBService (SharedPreferences)
    │
    ├─► Dio Instance
    │
    ├─► ApiServices (Dio + LocalDB)
    │
    ├─► AddressRepoImp (ApiServices)
    │
    └─► AddressCubit (AddressRepoImp)


═══════════════════════════════════════════════════════════════════════════
                         STATE TRANSITION DIAGRAM
═══════════════════════════════════════════════════════════════════════════

                        AddressInitial
                              │
                              ▼
        ┌─────────────────────┴─────────────────────┐
        │                                           │
        ▼                                           ▼
  AddressLoading                          AddressActionLoading
        │                                           │
    ┌───┴───┐                               ┌───────┴────────┐
    │       │                               │                │
    ▼       ▼                               ▼                ▼
AddressLoaded  AddressError         AddressActionSuccess  AddressError
    │                                      │
    └──────────────────────────────────────┘
                    │
                    ▼
               AddressLoaded
               (refreshed)


═══════════════════════════════════════════════════════════════════════════
                           FILE RELATIONSHIPS
═══════════════════════════════════════════════════════════════════════════

locator.dart ─────► AddressRepoImp ─────► AddressCubit
                          │                      │
                          │                      │
                          ▼                      ▼
                    ApiServices            AddressState
                          │
                          │
                          ▼
                      endpoints.dart
                          │
                          │
                          ▼
                    Backend API
                          │
                          │
                          ▼
                    AddressModel ◄──── JSON Response
                          │
                          │
                          ▼
            ┌─────────────┴─────────────┐
            │                           │
            ▼                           ▼
    MyAddressesView            AddressCard Widget
            │                           │
            │                           │
            ▼                           ▼
    AddAddressView              EditAddressView


═══════════════════════════════════════════════════════════════════════════

Key Principles Applied:
✅ Clean Architecture (Separation of concerns)
✅ Repository Pattern (Data abstraction)
✅ BLoC Pattern (State management)
✅ Dependency Injection (Loose coupling)
✅ Single Responsibility (Each class has one job)
✅ Error Handling (Either type for safety)
✅ Type Safety (Strong typing with models)

```
