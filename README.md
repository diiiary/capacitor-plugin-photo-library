# capacitor-plugin-photo-library

This plugin mainly used for getting all the images from system album and display using your own HTML/CSS.

## Process:

- ✅[ios] getPhotos, getPhoto
- ☑️[Android] need your help! please submit your changes, I will merge and publish

## Install

```
npm install capacitor-plugin-photo-library
npx cap sync
```

## Methods

### getPhotos

Read the photo list (like a thumbnail list)

```javascript
const { total, images } = await Capacitor.Plugins.PhotoLibrary.getPhotos({
  offset: 0,
  limit: 10,
  width: 200,
  height: 200,
  quality: 100,
  mode: "fast"
});
images.map(image => {
  const { id, createTime, base64, location } = image;
  // ...
});
```

### getPhoto

Read the photo content

```javascript
const { total, images } = await Capacitor.Plugins.PhotoLibrary.getPhotos({
  id: "",
  width: 200,
  height: 200,
  quality: 100,
  mode: "fast"
});
images.map(image => {
  const { id, createTime, base64, location } = image;
  // ...
});
```

## Licence

MIT

## Thank you!
