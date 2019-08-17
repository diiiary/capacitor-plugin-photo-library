import { WebPlugin } from "@capacitor/core";
import { PhotoLibraryPlugin, GetPhotosResponse } from "./definitions";
export declare class PhotoLibraryWeb extends WebPlugin implements PhotoLibraryPlugin {
    constructor();
    getPhotos(): Promise<GetPhotosResponse>;
}
declare const PhotoLibrary: PhotoLibraryWeb;
export { PhotoLibrary };
