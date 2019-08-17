# capacitor-plugin-photo-library

This plugin mainly used for getting all the images from system album and display using your own HTML/CSS.

## Process:

- ✅[ios] getPhotos
- ☑️[Android] need your help! please submit your changes, I will merge and publish

## Install

```
npm install capacitor-plugin-photo-library
npx cap sync
```

## Methods

### getPhotos

Read the photos by ids or limit/offset

```javascript
const { total, images } = await Capacitor.Plugins.PhotoLibrary.getPhotos({
  ids: [], // photo ids
  offset: 0, // fetch offset (will be ignored when ids set)
  limit: 10, // fetch limit (will be ignored when ids set)
  width: 200, // image width
  height: 200, // image height
  quality: 100, // image quality
  mode: "fast" // mode: fast | exact
});
images.map(image => {
  const { id, createTime, dataUrl, location } = image;
  // ...
});
```

## Licence

MIT

## Thank you!
