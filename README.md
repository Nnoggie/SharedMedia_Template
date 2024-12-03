# SharedMedia Template

This project is a template for creating custom media for WeakAuras and other AddOns that use LibSharedMedia-3.0. The project is set up to create a custom media AddOn that can be uploaded to [Wago Addons](https://addons.wago.io/).

# Instructions

1. Create a new Wago Addon project at [https://addons.wago.io/developers](https://addons.wago.io/developers). We need the Wago ID of the project for the next steps.
   ![Example Image](https://i.imgur.com/izbd9Uu.png)
2. Download the SharedMedia Template (this repository) [here](https://github.com/Nnoggie/SharedMedia_ExampleName/archive/refs/heads/main.zip)
3. Open the zip and drag the folder SharedMedia_ExampleName-main to your World of Warcraft/Interface/AddOns folder
4. Rename the folder SharedMedia_ExampleName-main to whatever you want your custom media AddOn to be called. Examples: SharedMedia_NnoggieUI, NnoggieUI_Media etc.
5. Run the file UpdateMedia.bat located within in the folder you just renamed. This will create the necessary folders and files for your custom media. Follow the steps in the console window. When asked for the Wago ID, enter the ID you got in step 1.
6. Add your custom media to the appropriate folders that the script created in step 5. You can add textures, sounds, fonts etc. The media will be available in WeakAuras and other AddOns that use LibSharedMedia-3.0.
7. Run UpdateMedia.bat again to register the files and automatically create a zip file that you can upload to Wago Addons.
8. Upload the zip file to your Wago Addon project.
