import { WebPlugin } from '@capacitor/core';
import { PhotoLibraryPlugin } from './definitions';

export class PhotoLibraryWeb extends WebPlugin implements PhotoLibraryPlugin {
  constructor() {
    super({
      name: 'PhotoLibrary',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const PhotoLibrary = new PhotoLibraryWeb();

export { PhotoLibrary };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(PhotoLibrary);
