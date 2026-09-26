# Hostel Hisab V10

## Khata wording and history controls
- Renamed the Khata action from "Clear / settle account" to "Settle account".
- Settlement confirmation now clearly explains whether money is being received or paid.
- Settling an account keeps the full transaction history and records a settlement entry.
- Added a separate "Delete history" action for permanently removing a friend's Khata transactions.
- Delete history requires confirmation and does not delete the friend account.
- Fixed settlement calculation so settling after previous settlements only settles the current outstanding balance, not the entire historical total.
