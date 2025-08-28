-- nvim-scissors
local scissors_ok, scissors = pcall(require, "scissors")
if scissors_ok then
  scissors.setup()
end
