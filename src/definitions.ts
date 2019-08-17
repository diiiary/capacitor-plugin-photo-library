declare module "@capacitor/core" {
  interface PluginRegistry {
    PhotoLibrary: PhotoLibraryPlugin;
  }
}

export interface GetPhotosParams {
  offset: number; // fetch offset
  limit: number; // fetch limit
  width: number; // thumbnail width
  height: number; // thumbnail height
  quality: number; // thumbnail quality
  mode: string; // fetch mode: "fast" | "exact"
}

export interface GetPhotosResponse {
  total: number; // total number of all photos
  images: Photo[]; // image list
}

export interface GetPhotoParams {
  id: string; // image id
  width: number; // thumbnail width
  height: number; // thumbnail height
  quality: number; // thumbnail quality
  mode: string; // fetch mode: "fast" | "exact"
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
  getPhoto(options: { id: string }): Promise<Photo>;
}
