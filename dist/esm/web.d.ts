import { WebPlugin } from "@capacitor/core";
import { PhotoLibraryPlugin, Photo, GetPhotosResponse } from "./definitions";
export declare class PhotoLibraryWeb extends WebPlugin implements PhotoLibraryPlugin {
    constructor();
    getPhotos(): Promise<GetPhotosResponse>;
    getPhoto(): Promise<Photo>;
}
declare const PhotoLibrary: PhotoLibraryWeb;
export { PhotoLibrary };
