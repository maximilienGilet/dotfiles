local M = {}

-- M.suckless = {
--   [[           ]],
--   [[           ]],
--   [[           ]],
--   [[           ]],
--   [[      ▀    ]],
--   [[█▀█▄█▀█▀█▀█]],
--   [[           ]],
--   [[           ]],
-- }

-- M.great_slash = {
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣀⣠⣶⣶⣶⣿⣿⣿⣟⠟⠉⠁ ⠉⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣵⣶⣿⣿⣿⡿⣟⢿⡝⠙⠀⠤⠤⣤⣤⡶⠂⠀]],
--   [[⠀⠀⠀⠀⢀⠴⣪⣾⣿⣿⣿⣿⣿⢿⡿⠃⢿⢸⣧⡍⠭⣭⣿⡿⠋⠀⠀⠀]],
--   [[⠀⠀⠀⢀⣵⣿⣿⣿⣿⣿⢯⠟⡵⠋ ⢠⢾⣿⣿⣿⡤⣼⢏⣠⣀⠀⠀⠀]],
--   [[⠀⢠⣰⣻⣿⣿⣿⣾⣿⣧⢡⣘⠁⠀⠀⠘⣄⣻⣿⣿⣷⣿⣿⡿⠍⠁⠀⠀]],
--   [[⠀⡇⡿⣿⣿⣿⡿⣿⡻⣿⣜⢄⣶⣤⣀⠀⠀⠀⠈⠛⢻⣟⠫⠉⠀⠀⠀⠀]],
--   [[⠀⠣⡻⣌⡻⠿⣿⣮⣽⣿⣶⣾⣿⣳⠶⠖⠬⠍⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠈⠀⠉⠉⠙⠛⠛⠒⠓⠒⠀⠀⠀⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
-- M.mothwing = {
--   [[⠀⠀⠀⠀⢠⣶⡦⠀⣠⣤⣤⣤⣀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⢸⣿⣧⣾⣿⣣⠄⣹⣿⠟⢆⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠙⣿⣿⣿⣷⣿⣾⣿⣧⣸⡆⠀]],
--   [[⠀⠀⠀⠀⠀⠐⢿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀]],
--   [[⠀⠀⠀⠀⠀⠻⣮⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀]],
--   [[⠀⠀⠀⠀⡠⢞⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀]],
--   [[⠀⠀⡰⣓⣼⡿⡿⢻⣭⣾⣿⢿⢻⡰⠀⠀⠀]],
--   [[⠀⡮⡺⠕⡫⠋⣬⣴⣿⣿⣿⣸⠸⡱⡄⠀⠀]],
--   [[⠸⡰⡝⣨⠕⠊⠀⣿⣿⣿⠏⠏⣶⡕⡇⠀⠀]],
--   [[⠘⠀⡢⠁⠀⠀⠀⠋⠋⠀⠀⢰⡘⠰⠇⠀⠀]],
--   [[           ⠸⠁⠀⠀⠀⠀]],
-- }
--
-- M.radiance = {
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⡇⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠃⢀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠷⣷⢷⣴⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣧⣅⣂⣧⣾⣷⣇⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⢀⠀⠀⠀⢀⢠⢐⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠑⢆⣠⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠢⢦⣀⣴⣾⣿⣭⣶⠵⠩⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⣘⠿⣿⣷⠶⠿⠦⠴⠠⡀⠀]],
--   [[⠀⠀⢀⣀⣘⣩⣙⣫⣭⣶⡿⣫⣪⣭⢛⠿⣿⣿⡿⠋⣩⣝⢶⣝⡿⣶⣭⣓⡦⢍⠂⠄⠀⠀]],
--   [[⠀⠀⠀⠐⠋⠩⢭⣉⣩⣵⢞⣵⡿⠁⠊⢀⣻⣿⡁⠉⡪⡻⣷⣝⢿⣶⡝⠭⡙⠓⠤⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠈⠉⠉⢉⢉⠠⠟⠉⠂⠀⠀⠠⣭⢩⡤⠀⠁⠰⠈⠙⠷⡈⠙⢆⠀⠆⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠟⠸⢓⠀⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢠⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣾⠸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
--
-- M.venom = {
--   [[⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀]],
--   [[⠀⠀⣾⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⡇⠀]],
--   [[⠀⠀⡏⢿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⡗⠀⠀]],
--   [[⠀⠀⠁⠘⣿⣿⣿⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⠁⠀⠀]],
--   [[⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣷⣍⠡⠀⠀⠀⠀⠀⠀⢋⣽⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠹⣻⣿⣿⣿⣿⣿⣧⣀⠀⠀⠀⠠⣀⣾⣿⣿⣿⡿⣟⣿⠏⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠈⠹⠜⠋⠟⠿⠉⠀⠀⠀⠀⠀⠑⠻⢿⠙⠩⠫⠛⠁⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⢠⠠⡆⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢀⠀⠄⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠂⠇⠰⠄⡞⠀⣼⠀⣿⡄⢰⡷⠸⣧⢰⡆⠨⡂⡾⡐⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠈⠈⢧⢹⡇⢿⠀⢿⠇⠈⡇⠨⡟⢸⡇⡿⠡⠁⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠸⡀⢸⠀⠀⠇⢸⠃⡿⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠈⠀⠀⠀⠊⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⢳⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡎⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠘⠧⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠏⠁⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣆⢡⢠⠀⡀⢠⢀⡄⡆⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠸⠘⢂⡆⢸⣸⢃⠇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠋⠎⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
-- M.symbol = {
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⠀⠀]],
--   [[⠀⠀⢦⣀⠀⠈⢣⡀⠀⠀⣀⣀⣀⣀⣴⠁⣠⡶⠀⠀⢀⣴⠋⠁⠀⠀⠀]],
--   [[⠀⠀⠀⠙⢷⣄⠈⢿⡞⠛⠉⠉⠉⢹⠃⣠⡞⠀⣠⣴⠟⠀⢀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠙⢣⣀⢡⡶⠞⠛⠛⠣⢦⠝⣠⣾⠟⢁⣤⠔⠃⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠙⠣⠀⢀⣀⣀⣀⣴⣾⠿⠡⠚⠻⣧⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠰⣾⠟⢉⡉⠙⣿⡅⢀⡀⡀⠀⢹⡄⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⡀⠻⠟⢀⣿⠃⠘⠶⠃⠀⢸⡇⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⢀⠠⡶⣡⠄⣠⡿⠿⠶⠶⠟⠉⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠘⠂⢡⡾⠋⠀⠀⠀⠀⠀⠀⠀⠱⣤⣠⡾⠃⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠐⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⢴⡀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀]],
-- }
--
-- M.scorpion = {
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⢠⠠⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣔⡀⠚⠀⠀⠠⠒⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡟⠁⠀⠀⠀⢀⡋⢙⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠛⠀⠀⢀⠀⠀⢐⣣⠤⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠁⠢⡄⠀⡈⠀⢐⠧⢀⠇⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢂⠀⠀⠀⣘⢀⠇⣀⡱⢈⡁⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⢀⣠⢤⡍⢛⡆⣻⡴⣾⡸⣎⣳⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⣀⣠⣤⣤⣀⡀⣀⣀⡀⠀⢇⣤⣷⣿⣴⣌⣰⡤⡁⢀⡤⠄⠠⡄⠀⠀]],
--   [[⠀⠀⠀⢈⣽⣿⣿⣿⣿⠟⠑⠉⠑⠷⠱⣮⢹⣿⣿⣿⠟⠸⡭⠬⢥⣄⠀⠀⢀⠀⠀]],
--   [[⠀⠀⠔⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢛⣑⣓⢬⣕⠋⠙⢦⠀⢀⠍⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⡃⠀⠀⡃⠀⢸⠀⠈⠂⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⠀⢀⣤⢾⠃⠁⠀⠀⠃⠁⠀⠉⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠐⢄⣀⣀⣠⣴⣿⣿⣿⢣⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⢀⠀⠀⠈⠉⣹⣿⣿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠈⠉⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
M.raven = {
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠀ ]],
  [[ ⠀⠀⢤⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣢⢃⡶ ]],
  [[ ⠀⠀⣼⡶⠘⠀⠀⠀⠀⠀⠀⠀⠀⢠⢀⠄⠀⠢⢼⣿⣿⣷⡅ ]],
  [[ ⠠⠀⣿⣿⢇⡀⠀⠀⠀⠀⠀⠀⡤⠀⢈⢄⡇⣪⣿⣿⣿⢟⡠ ]],
  [[ ⠀⢸⣿⣿⣟⡐⠁⣀⠀⠀⠀⣠⡤⡨⣳⣿⣿⣿⣿⣿⣿⡿⠃ ]],
  [[ ⠀⠀⢻⣿⣿⣇⠸⠠⠀⠀⣠⣿⣷⣿⣿⣿⣿⣿⣿⣿⠿⠁⠁ ]],
  [[ ⠀⠀⠀⠙⠿⣿⣮⣄⣄⣈⣾⣿⣿⣿⣿⣿⣿⣿⣿⢏⠹⠄⠃ ]],
  [[ ⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠻⠀⠙⠠⠀⠀ ]],
  [[ ⠀⠀⠀⠈⢤⡟⠻⣿⣿⣿⣿⣿⣿⡿⠿⡻⠳⠁⠀⠁⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠁⠙⢿⣿⣿⣿⣿⣶⣾⣷⣶⣦⣤⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⢀⣤⡶⡖⠿⣿⣿⣿⣿⡿⠏⠝⠁⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠈⠀⠡⠔⠀⠈⠙⠙⠑⠂⠀⠀⠀⠀⠀⠀⠀⠀ ]],
}

M.yggdrasil = {
  [[ ⠀⠀⠀⠀⠀⠀⢀⢀⠀⣄⢂⣀⣂⣤⣀⢀⢀⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⣄⣰⣝⣉⣙⢱⣞⠜⡖⣌⣌⣁⣻⣠⣀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⢔⢽⣊⣂⣇⡒⠮⢻⣇⠲⢍⣿⢟⣒⣰⣠⣑⡔⣀⠀⠀ ]],
  [[ ⠀⠹⡸⢙⣕⡐⢂⠍⣩⡻⣿⣆⣾⠟⣉⢣⠪⠲⡰⡋⣢⢆⠀ ]],
  [[ ⠀⣪⡹⣵⢦⠽⡓⠶⠶⣧⣹⣿⣏⣴⠶⠛⠟⠽⢛⣒⢮⡙⠀ ]],
  [[ ⠸⢋⢪⠑⢩⠈⠀⠀⠀⠈⣿⣿⣿⠁⠀⠀⠘⢠⠈⠆⢎⢱⠁ ]],
  [[ ⠀⠻⡕⡲⡈⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠆⠄⠁ ]],
  [[ ⠀⠀⠀⠇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣤⡀⠀⠀⠀⠀⠌⠘⠀⠀ ]],
  [[ ⠀⠀⠀⢱⠒⡶⡶⢖⣫⡿⢻⠿⡟⢿⣍⡱⢖⠶⠒⡆⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠁⠬⡃⠴⣇⣴⠏⠖⠙⣦⣸⠦⡼⠣⠉⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠈⠁⠑⠢⠧⠭⠼⠵⠋⠊⠁⠀⠀⠀⠀⠀⠀ ]],
}
--
-- M.void_stranger = {
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⣀⣴⣶⣄⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⣴⠋⠁⠈⣿⡟⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⣾⣏⣀⠠⠞⠉⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⣸⣿⠏⠀⠀⠀⠀ ⠀⣀⡀⠀⠀]],
--   [[⠀⢰⣿⣿⠀⠀⠀⠀⡠⠒⠿⣿⣿⣧⠀]],
--   [[⠀⠀⣿⣿⣷⣤⡠⠊⠀⠀⠀⢸⣿⣿⠀]],
--   [[⠀⠀⠈⠛⠋⠁⠀⠀⠀⠀⠀⣼⣿⡇⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⢀⡤⠖⠈⣿⡿⠀⠀]],
--   [[⠀⠀⠀⠀⠀⢀⣾⣿⠀⠀⣰⠗⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠘⠯⢻⠶⠊⠁⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
-- M.aot = {
--   [[⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡄⠀⠀]],
--   [[⢰⠒⠒⢻⣿⣶⡒⠒⠒⠒⠒⠒⠒⠒⠒⠒⡲⠊⣰⣓⡒⡆]],
--   [[⢸⢸⢻⣭⡙⢿⣿⣍⡉⠉⡇⡏⠉⠉⣩⠋⢀⣔⠕⢫⡇⡇]],
--   [[⢸⢸⣈⡻⣿⣶⣽⡸⣿⣦⡇⡇⡠⠊⣸⢶⠋⢁⡤⠧⡇⡇]],
--   [[⢸⢸⠻⣿⣶⣝⠛⣿⣮⢻⠟⣏⣠⠞⠁⣼⡶⠋⢀⣴⡇⡇]],
--   [[⢸⢸⣿⣶⣍⠻⠼⣮⡕⢁⡤⢿⢁⡴⠊⣸⣵⠞⠋⢠⡇⡇]],
--   [[⢸⢘⣛⡻⣿⣧⢳⣿⣧⠎⢀⣾⠋⡠⠞⢱⢇⣠⡴⠟⡇⡇]],
--   [[⢸⢸⠹⣿⣷⣎⣉⣻⢁⡔⢁⢿⡏⢀⣤⢾⡟⠁⣀⣎⡇⡇]],
--   [[⢸⢸⠲⣶⣭⡛⠚⢿⢋⡔⢁⣼⠟⢋⣠⣼⠖⠋⢁⠎⡇⡇]],
--   [[⢸⢸⢤⣬⣛⠿⠞⣿⢋⠔⣉⣾⠖⠋⢁⣯⡴⠞⢃⠂⡇⡇]],
--   [[⢸⢸⠀⢙⣻⢿⣧⣾⡵⠚⣉⣯⠶⠛⣹⣧⠤⢮⠁⠀⡇⡇]],
--   [[⠸⣘⠢⣄⠙⠿⢷⡡⠖⣋⣽⠥⠒⣩⣟⣤⣔⣁⡤⠖⣃⠇]],
--   [[⠀⠀⠙⠢⢍⣻⡿⠒⢉⣴⣗⣚⣽⣋⣀⣤⣊⠥⠒⠉⠀⠀]],
--   [[⠀⠀⠀⢀⣔⠥⠒⢮⣙⠾⠀⠷⣚⡭⠞⠉⠛⠦⣀⠀⠀⠀]],
--   [[⠀⠀⠀⠉⠀⠀⠀⠀⠈⠑⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
M.meatboy = {
  [[⠀⠀⣀⣀⣤⣤⣦⣶⢶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⡄⠀⠀⠀⠀⠀]],
  [[⠀⠀⣿⣿⣿⠿⣿⣿⣾⣿⣿⣿⣿⣿⣿⠟⠛⠛⢿⣿⡇⠀⠀⠀⠀⠀]],
  [[⠀⠀⣿⡟⠡⠂⠀⢹⣿⣿⣿⣿⣿⣿⡇⠘⠁⠀⠀⣿⡇⠀⢠⣄⠀⠀]],
  [[⠀⠀⢸⣗⢴⣶⣷⣷⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣴⣿⣗⣄⣼⣷⣶⡄]],
  [[⠀⢀⣾⣿⡅⠐⣶⣦⣶⠀⢰⣶⣴⣦⣦⣶⠴⠀⢠⣿⣿⣿⣿⣼⣿⡇]],
  [[⢀⣾⣿⣿⣷⣬⡛⠷⣿⣿⣿⣿⣿⣿⣿⠿⠿⣠⣿⣿⣿⣿⣿⠿⠛⠃]],
  [[⢸⣿⣿⣿⣿⣿⣿⣿⣶⣦⣭⣭⣥⣭⣵⣶⣿⣿⣿⣿⣟⠉⠀⠀⠀⠀]],
  [[⠀⠙⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⣿⣿⣿⣿⣿⣛⠛⠛⠛⠛⠛⢛⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠿⣿⣿⣿⠿⠿⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠿⠇⠀⠀⠀⠀⠀]],
}
--
-- M.isaac = {
--   [[        ⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣄⣀       ]],
--   [[    ⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄    ]],
--   [[  ⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣆  ]],
--   [[ ⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧ ]],
--   [[ ⣾⣿⡿⠟⡋⠉⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠙⠻⣿⣿⣇]],
--   [[⢠⣿⡏⢰⣿⣿⡇  ⢸⣿⣿⣿⠿⠿⣿⣿⣿⠁⣾⣿⣷  ⠘⣿⣿]],
--   [[⠸⣿⣇⠈⠉⠉  ⢀⣼⡿⠋    ⠙⢿⣄⠙⠛⠁  ⢠⣿⣿]],
--   [[ ⢿⣿⡇   ⣶⣿⣿⢁⣤⣤⣤⣤⣤⣤ ⣿⣷   ⠈⢹⣿⡟]],
--   [[ ⠈⢿⡗  ⢸⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿    ⢸⡟ ]],
--   [[   ⠳⡀ ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ⠌  ]],
--   [[      ⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤      ]],
--   [[       ⠉⠙⠻⠿⠿⣿⣿⣿⣿⠿⠿⠛⠉       ]],
-- }
--
M.gta = {
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⡀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⠟⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣿⣷⣄⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣿⡆⠀⠀⠉⠉⠀⠈⣶⡆⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢻⣷⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⠟⠀⠀⠀⠀⠀⠀⠀⣸⣿⡄]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣷]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⢰⣾⣿⠏]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠟⠁⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[Ah shit, here we go again.]],
}

M.hydra = {
  [[  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ]],
  [[   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ]],
  [[         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ]],
  [[          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   ]],
  [[         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ]],
  [[  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ]],
  [[ ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  ]],
  [[⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ]],
  [[⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄]],
  [[     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    ]],
  [[      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣾⡿⠃    ]],
}
--
-- M.spider = {
--   [[    ▐  ▌     ▐  ▌    ]],
--   [[   ▐▌ █       █ ▐▌   ]],
--   [[  ▄█  ▀▀▄▌▄▐▄▀▀  █▄  ]],
--   [[ ▐█ ▄█▀▄█████▄▀█▄ █  ]],
--   [[  ▀▀ ▄▄▄█████▄▄▄ ▀▀  ]],
--   [[   ▄█▀ ▄▀███▀▄ ▀█▄   ]],
--   [[ ▄█  ▄▀  ███  ▀▄  █▄ ]],
--   [[▐█   █   ▐█▌   █   █▌]],
--   [[ █    █   ▀   █    █ ]],
--   [[ ▀█   █       █   █▀ ]],
--   [[  █    █     █    █  ]],
--   [[   █   █     █   █   ]],
--   [[    ▌   ▌   ▐   ▐    ]],
-- }
--
M.moth = {
  [[⠀⠀⠀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀]],
  [[⢀⡖⢭⡿⡁⣶⠒⢍⣩⡿⢽⣷⣦⣤⣀⠀⢾⣏⡋⡽⠇⠀⣀⣤⢴⣚⠟⣉⣉⡽⠖⠪⡟⣹⡿⠆]],
  [[⠈⠙⠵⣫⠵⣐⣏⢒⣲⠿⢷⣛⣹⡽⣿⢻⣾⠿⡛⡧⣷⣛⣷⣯⣿⣲⢶⣾⣚⢇⢁⡼⣿⠟⠋⠀]],
  [[⠀⠀⠀⠘⠿⣵⣫⠾⣛⣫⢫⠕⠂⠈⠀⢩⣷⠾⢲⢯⣍⠓⠉⠚⠹⣿⣯⣿⣹⣾⣿⠟⠁⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠉⢠⡾⣫⡶⡂⠀⠀⠀⠐⡟⠖⡙⡧⠆⠀⠀⠀⠀⣿⢋⣻⡧⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠘⢾⣕⢕⠰⡀⠀⠀⠀⣯⠩⠏⠇⠐⡀⠀⠀⢠⣇⣰⡿⠃⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠃⠉⠉⠃⠀⠀⢻⣨⡈⠀⠃⠑⠀⠘⠋⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
}
--
-- M.skull = {
--   [[⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣶⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀ ]],
--   [[⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⡟⠁⠀⠀⠀⠈⢻⣿⣿⣿⠀⠀⠀⠀⠀⠀ ]],
--   [[⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠛⠛⠛⠛⠛⠛⢛⣿⣮⣿⣿⣿⠀⠀⠀⠀⠀⠀⢈⣿⣿⡟⠀⠀⠀⠀⠀⠀ ]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣧⡀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⢀⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⠟⠉⠻⣿⣿⣿⣿⣶⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣠⣷⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠛⠋⠛⠙⠛⠙⠛⠙⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }
--
-- M.morse = {
--   [[                                               ]],
--   [[                                               ]],
--   [[                                               ]],
--   [[                                               ]],
--   [[                                               ]],
--   [[  ▄▄         ▄▄ ▄▄ ▄▄         ▄▄         ▄▄ ▄▄ ]],
--   [[     ▄   ▄              ▄ ▄ ▄      ▄ ▄         ]],
--   [[                                               ]],
--   [[                                               ]],
--   [[                                               ]],
-- }
--
-- M.sharp = {
--   [[                                                                       ]],
--   [[                                                                     ]],
--   [[       ████ ██████           █████      ██                     ]],
--   [[      ███████████             █████                             ]],
--   [[      █████████ ███████████████████ ███   ███████████   ]],
--   [[     █████████  ███    █████████████ █████ ██████████████   ]],
--   [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
--   [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
--   [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
--   [[                                                                       ]],
-- }
--
M.galaxy = {
  [[        ⠀⠀⢀⣀⣀⡀⠒⠒⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⢀⣤⣶⡾⠿⠿⠿⠿⣿⣿⣶⣦⣄⠙⠷⣤⡀⠀⠀⠀⠀]],
  [[⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣷⣄⠘⢿⡄⠀⠀⠀]],
  [[⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠐⠂⠠⢄⡀⠈⢿⣿⣧⠈⢿⡄⠀⠀]],
  [[⢀⠏⠀⠀⠀⢀⠄⣀⣴⣾⠿⠛⠛⠛⠷⣦⡙⢦⠀⢻⣿⡆⠘⡇⠀⠀]],
  [[⠀⠀⠀⠀⡐⢁⣴⡿⠋⢀⠠⣠⠤⠒⠲⡜⣧⢸⠄⢸⣿⡇⠀⡇⠀⠀]],
  [[⠀⠀⠀⡼⠀⣾⡿⠁⣠⢃⡞⢁⢔⣆⠔⣰⠏⡼⠀⣸⣿⠃⢸⠃⠀⠀]],
  [[⠀⠀⢰⡇⢸⣿⡇⠀⡇⢸⡇⣇⣀⣠⠔⠫⠊⠀⣰⣿⠏⡠⠃⠀⠀⢀]],
  [[⠀⠀⢸⡇⠸⣿⣷⠀⢳⡈⢿⣦⣀⣀⣀⣠⣴⣾⠟⠁⠀⠀⠀⠀⢀⡎]],
  [[⠀⠀⠘⣷⠀⢻⣿⣧⠀⠙⠢⠌⢉⣛⠛⠋⠉⠀⠀⠀⠀⠀⠀⣠⠎⠀]],
  [[⠀⠀⠀⠹⣧⡀⠻⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠃⠀⠀]],
  [[⠀⠀⠀⠀⠈⠻⣤⡈⠻⢿⣿⣷⣦⣤⣤⣤⣤⣤⣴⡾⠛⠉⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠈⠙⠶⢤⣈⣉⠛⠛⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
}
--
-- M.bold = {
--   [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
--   [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
--   [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
--   [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
--   [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
--   [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
-- }
--
-- M.pacman = {
--   [[                      ██████                     ]],
--   [[                  ████▒▒▒▒▒▒████                 ]],
--   [[                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██               ]],
--   [[              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██             ]],
--   [[            ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒               ]],
--   [[            ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓           ]],
--   [[            ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓           ]],
--   [[          ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██         ]],
--   [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
--   [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
--   [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
--   [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
--   [[          ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██         ]],
--   [[          ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██         ]],
--   [[          ██      ██      ████      ████         ]],
--   [[                                                 ]],
-- }
--
-- M.n = {

--   [[          .          .]],
--   [[        ';;,.        ::']],
--   [[      ,:::;,,        :ccc,]],
--   [[     ,::c::,,,,.     :cccc,]],
--   [[     ,cccc:;;;;;.    cllll,]],
--   [[     ,cccc;.;;;;;,   cllll;]],
--   [[     :cccc; .;;;;;;. coooo;]],
--   [[     ;llll;   ,:::::'loooo;]],
--   [[     ;llll:    ':::::loooo:]],
--   [[     :oooo:     .::::llodd:]],
--   [[     .;ooo:       ;cclooo:.]],
--   [[       .;oc        'coo;.]],
--   [[         .'         .,.]],
-- }

return M