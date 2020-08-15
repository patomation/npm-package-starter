// Webpack hot reload type fix
declare const module: {
  hot: {
    accept: () => void
  }
}

declare module '*.jpg'
declare module '*.jpeg'
declare module '*.png'
declare module '*.gif'
declare module '*.svg'
declare module '*.eot'
declare module '*.woff'
declare module '*.woff2'
declare module '*.ttf'
declare module '*.wav'
declare module '*.mp3'
