import { WebPlugin } from "@capacitor/core";
import { PhotoLibraryPlugin, Photo, GetPhotosResponse } from "./definitions";

export class PhotoLibraryWeb extends WebPlugin implements PhotoLibraryPlugin {
  constructor() {
    super({
      name: "PhotoLibrary",
      platforms: ["web"]
    });
  }

  async getPhotos(): Promise<GetPhotosResponse> {
    throw "No web implement";
  }
  async getPhoto(): Promise<Photo> {
    throw "No web implement";
  }
}

const PhotoLibrary = new PhotoLibraryWeb();

export { PhotoLibrary };

import { registerWebPlugin } from "@capacitor/core";
registerWebPlugin(PhotoLibrary);
