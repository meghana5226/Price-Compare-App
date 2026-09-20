import { useState } from 'react'

export default function SearchBar({ onSearch, onClear }) {
  const [value, setValue] = useState('')

  function handleSubmit(e) {
    e.preventDefault()
    if (value.trim()) {
      onSearch(value.trim())
    } else {
      onClear()
    }
  }

  return (
    <form className="search-bar" onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Search for a product (e.g. iPhone, headphones, laptop)..."
        value={value}
        onChange={(e) => setValue(e.target.value)}
      />
      <button type="submit">Search</button>
    </form>
  )
}
