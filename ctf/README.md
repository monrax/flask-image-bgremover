# BgRemove CTF

Introducing BgRemove, your new go-to tool powered by AI for effortlessly removing backgrounds from images. Just upload your image via API, receive it back with the background gone, all in a flash. Perfect for creating clean, sleek visuals without the hassle of manual editing.

Want to try it out? Check out the API docs at [/docs](./docs).

## v2

Exciting news! For v2, BgRemove introduces a new feature that enhances user flexibility and creativity. Now, you can utilize "image expressions" from the Pillow Python library to tweak your images before removing the background. The updated v2/remove endpoint accepts both the image and the expression, applying edits such as resizing, cropping, or applying filters before initiating the background removal process. This enhancement empowers users to tailor their images precisely to their preferences before utilizing BgRemove's cutting-edge background removal capabilities.

## Usage

TODO

### Image Expressions

TODO

## Security disclaimer

Users are advised that the application now mandates the use of the latest versions of its dependencies due to identified security vulnerabilities in prior versions (**CVE-2023-50447** and **CVE-2022-22817**). These vulnerabilities may pose risks to data security and integrity. It is essential to update to the latest versions promptly to mitigate these risks and ensure robust protection against known threats. Thank you for prioritizing security in your use of the application.

---

all that ^ was mostly written by ai