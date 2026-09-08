# Hostel Hisab V4

This version fixes the issues reported in the previous build.

## Changes
- Previous/next day arrows on Dashboard, Tiffin, Milk, Custom tracker pages, and tracker detail pages.
- Fixed the Milk page `DateNav is not defined` runtime error by defining and using the DateNav component.
- Custom trackers now appear in the Dashboard under **My trackers**.
- Custom trackers also appear in the left sidebar as their own menu items.
- Each custom tracker gets its own detail page.
- Custom tracker data is included in monthly Reports.
- Milk can be completely disabled from Settings.
- When Milk is disabled, Milk disappears from the sidebar, Dashboard, Calendar and Reports, and the layout automatically reflows.
- Milk rate and other numeric Settings fields can be temporarily cleared while editing instead of immediately becoming zero.
- Setting Milk quantity to 0 removes that day's milk record.
- Existing localStorage key remains `hostel-hisab-v2` so existing V2/V3 data can continue to load.

## Run
```bash
npm install
npm run dev
```
Then open http://localhost:3000


### V7 security features
- Forgot password email recovery
- Secure new-password screen
- Change password from Settings
- Show/hide password controls
