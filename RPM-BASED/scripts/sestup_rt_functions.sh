# ~/bash_functions.sh

# Function to automatically setup React and Tailwind with Vite
setup-rt() {
    # Default folder name
    local default_folder="demo-rt-project"

    # Determine the folder name to use
    if [ -z "$1" ]; then
        echo "No folder name provided. Setting up in the default directory $default_folder..."
        local folder_name=$default_folder
    else
        local folder_name=$1
        echo "Setting up Vite, React, and Tailwind CSS in $folder_name..."
    fi

    npm create vite@latest $folder_name -- --template react
    cd $folder_name || { echo "Failed to enter directory $folder_name"; exit 1; }
    
    # Clean up unnecessary files
    [ -d src/assets ] && rm -rf src/assets
    [ -f src/App.css ] && rm -f src/App.css
    [ -d public ] && rm -rf public

    # Install Tailwind CSS and related dependencies
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p

    # Create Tailwind config file
    echo "module.exports = {
        content: ['./index.html', './src/**/*.{js,jsx}'],
        theme: {
            extend: {},
        },
        plugins: [],
    }" > tailwind.config.js

    # Create Tailwind base styles
    echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/index.css

    # Modify App.jsx file
    echo "import React from 'react';

function App() {
  return (
    <>
    <div className='h-screen w-screen bg-slate-500'>
      <h1 className='text-3xl tracking-wider text-amber-50 text-center font-bold '>
        ASAN-TECH !!!
      </h1>
    </div>
    </>
  );
}

export default App;" > src/App.jsx

    # Add custom scripts to package.json
    sed -i '/"scripts": {/a \ \ \ \ "host": "vite --host",' package.json

    # Modify vite.config.js for HMR and polling
    echo "import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    hmr: true,
    watch: {
      usePolling: true
    }
  },
});" > vite.config.js

    # Install npm dependencies and start the dev server
    npm install
    npm run dev || echo "Failed to start the development server. Check package.json for scripts."

    echo "Vite, React, and Tailwind setup complete!"
}
