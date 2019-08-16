declare module "@capacitor/core" {
    interface PluginRegistry {
        PhotoLibrary: PhotoLibraryPlugin;
    }
}
export interface PhotoLibraryPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
