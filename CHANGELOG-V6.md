# Hostel Hisab V6

## New in V6
- Forgot password flow on the login screen.
- Supabase recovery email using the current site origin.
- Secure reset-password screen with password confirmation.
- Show/hide password on login/signup/reset.
- Change password from Settings for users who are already logged in.
- Updated footer/version text to V6.

## Supabase redirect setup
In Supabase, open **Authentication → URL Configuration** and add the exact production URL of the deployed Hostel Hisab app to **Redirect URLs**. For example:

`https://your-hostel-hisab-domain.vercel.app/**`

Keep your Site URL set to the main production URL.

The app requests password recovery with a redirect back to:

`https://your-hostel-hisab-domain.vercel.app/?reset=1`

The `PASSWORD_RECOVERY` auth event then opens the reset-password screen. No service-role key is used.
