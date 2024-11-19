/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'primary-black': '#000000',
        'primary-gray': '#333333',
        'secondary-gray': '#666666',
        'light-gray': '#f5f5f5',
      }
    },
  },
  plugins: [],
}

