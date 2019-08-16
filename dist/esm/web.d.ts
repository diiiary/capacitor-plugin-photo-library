import { WebPlugin } from '@capacitor/core';
import { PhotoLibraryPlugin } from './definitions';
export declare class PhotoLibraryWeb extends WebPlugin implements PhotoLibraryPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
declare const PhotoLibrary: PhotoLibraryWeb;
export { PhotoLibrary };
