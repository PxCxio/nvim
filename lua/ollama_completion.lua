-- Create a function to call Ollama
function OllamaComplete()
  -- Get the current buffer content
  local current_buffer = vim.fn.join(vim.api.nvim_get_lines(0, -1), "\n")

  -- Construct a prompt for Ollama
  local prompt = "Complete the following code:\n" .. current_buffer

  -- Call Ollama CLI
  local completion = vim.fn.system("ollama run codellama \"" .. prompt .. "\"")

  -- Return the completion
  return completion
end

-- Export the function for use by other plugins
return OllamaComplete
