# SharedMedia_Template

This project is a template for creating custom media for WeakAuras and other AddOns that use LibSharedMedia-3.0. The project is set up to create a custom media AddOn that can be uploaded to [Wago Addons](https://addons.wago.io/).

# Instructions

1. Create a new Wago Addon project at [https://addons.wago.io/developers](https://addons.wago.io/developers). We need the Wago ID of the project for the next steps.
   ![Example Image](https://i.imgur.com/izbd9Uu.png)
2. Download the SharedMedia Template (this repository) [here](https://github.com/Nnoggie/SharedMedia_Template/archive/refs/heads/main.zip)
3. Open the zip and drag the folder SharedMedia_Template-main to your World of Warcraft/Interface/AddOns folder
   ![Example Image](https://i.imgur.com/0CkLTQr.png)
4. Rename the extracted folder SharedMedia_Template-main to whatever you want your custom media AddOn to be called. Examples: SharedMedia_NnoggieUI, NnoggieUI_Media etc.
5. Make sure that you can see file extensions in Windows Explorer. If you can't see file extensions, go to View -> Show/hide -> File name extensions.
   ![alt text](https://i.imgur.com/ONjojvE.png)
6. Rename the file UpdateMedia.txt to UpdateMedia.bat located within in the folder you just renamed. Confirm the file extension change.
7. Run the file UpdateMedia.bat This will create the necessary folders and files for your custom media. Follow the steps in the console window. When asked for the Wago ID, enter the ID you got in step 1.
8. Add your custom media to the appropriate folders that the script created in step 7. You can add textures, sounds, fonts etc. The media will be available in WeakAuras and other AddOns that use LibSharedMedia-3.0.
9. Run UpdateMedia.bat again to register the files and automatically create a zip file that you can upload to Wago Addons.
10. Upload the zip file to your Wago Addon project.
