declare module "@capacitor/core" {
    interface PluginRegistry {
        PhotoLibrary: PhotoLibraryPlugin;
    }
}
export interface GetPhotosParams {
    offset: number;
    limit: number;
    width: number;
    height: number;
    quality: number;
    mode: string;
}
export interface GetPhotosResponse {
    total: number;
    images: Photo[];
}
export interface Photo {
    id: string;
    createTime: number;
    location: {
        latitude: number;
        longitude: number;
    };
    base64: string;
}
export interface PhotoLibraryPlugin {
    getPhotos(options: GetPhotosParams): Promise<GetPhotosResponse>;
}
