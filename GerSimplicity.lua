local GerSimplicityUsedFeatures = {
    warGoods = {},
    warCards = {},
    pelesat = {},
    GSBangunan = {},
    GSEarlyGame = {}
}

local function updateMainMenuTitles()
    local function isUsed(category)
        for _, v in pairs(GerSimplicityUsedFeatures[category]) do
            if v then return true end
        end
        return false
    end
    return {
        warGoods = isUsed("warGoods") and "✅ ⚒️ Barang Perang ⚒️ ✅" or "⚒️ Barang Perang ⚒️",
        warCards = isUsed("warCards") and "✅ 🔰 kartu Perang 🔰 ✅" or "🔰 kartu Perang 🔰",
        pelesat = isUsed("pelesat") and "✅ 🔱 Pelesat Perang 🔱 ✅" or "🔱 Pelesat Perang 🔱",
        GSEarlyGame = isUsed("GSEarlyGame") and "🛒 Early Game 🛒 ✅" or "🛒 Early Game 🛒",
        GSBangunan = isUsed("GSBangunan") and "✅ 🎮 SimpliServices 🎮 ✅" or "🎮 SimpliServices 🎮"
    }
end

function GerSimplicityPerang()
    gg.setVisible(false)
    gg.clearResults()
    local WarData = {
        baseItems = {
            ["⛓️ Besi"] = 267176888,
            ["🌴 Kayu"] = 2090874750,
            ["🔁 Plastik"] = -1270634091,
            ["🌱 Benih"] = 274276185,
            ["⛏️ Mineral"] = -1369888960,
            ["⚗️ Bahan Kimia"] = 1570439054,
            ["📦 Tekstil"] = 144394935
        },
        warGoods = {
            {
                name = "🧲 Perang Magnet",
                mapping = {
                    ["⛓️ Besi"] = 253271711,
                    ["🌴 Kayu"] = 860715237,
                    ["🔁 Plastik"] = 1560176023
                }
            },
            {
                name = "🐍 Perang Ular",
                mapping = {
                    ["⛓️ Besi"] = 352219700,
                    ["🌴 Kayu"] = -1607480754,
                    ["🔁 Plastik"] = 1560176023
                }
            },
            {
                name = "🎬 Perang Film B",
                mapping = {
                    ["⛓️ Besi"] = -1607480754,
                    ["🌴 Kayu"] = -1247109630,
                    ["🔁 Plastik"] = -1540742631
                }
            },
            {
                name = "🛡️ Perang Perisai",
                mapping = {
                    ["⛓️ Besi"] = -916988905,
                    ["🌴 Kayu"] = 2090081903,
                    ["🔁 Plastik"] = 226338627
                }
            }
        },
        warCards = {
            {
                name = "⭕ Class S",
                mapping = {
                    ["⛓️ Besi"] = 1430583743,
                    ["🌴 Kayu"] = 1430583746,
                    ["🔁 Plastik"] = -35376651,
                    ["🌱 Benih"] = 1430583747
                }
            },
            {
                name = "🔴 Class M",
                mapping = {
                    ["⛓️ Besi"] = 1430583749,
                    ["🌴 Kayu"] = 1430583748,
                    ["🔁 Plastik"] = -35376655,
                    ["🌱 Benih"] = -35376689
                }
            },
            {
                name = "🟢 Class L",
                mapping = {
                    ["⛓️ Besi"] = -35376688,
                    ["🌴 Kayu"] = 1430583750,
                    ["🔁 Plastik"] = -35376685,
                    ["🌱 Benih"] = -35376684
                }
            },
            {
                name = "🔵 Class D",
                mapping = {
                    ["⛓️ Besi"] = 1430583751,
                    ["🌴 Kayu"] = -35376683,
                    ["🔁 Plastik"] = -35376680,
                    ["🌱 Benih"] = -35376687
                }
            },
            {
                name = "⚪ Class XXL",
                mapping = {
                    ["⛓️ Besi"] = -35376681,
                    ["🌴 Kayu"] = -35376654,
                    ["🔁 Plastik"] = -35376648,
                    ["🌱 Benih"] = -35376647
                }
            },
            {
                name = "⚫ Class A+",
                mapping = {
                    ["⛓️ Besi"] = -35376650,
                    ["🌴 Kayu"] = -35376649,
                    ["🔁 Plastik"] = -35376623,
                    ["🌱 Benih"] = -35376622
                }
            }
        },
        pelesat = {
            {
                name = "🔱 Level 1",
                mapping = {
                    ["⛓️ Besi"] = 1965976282,
                    ["🌴 Kayu"] = 1736317036,
                    ["🔁 Plastik"] = 1692935226,
                    ["🌱 Benih"] = 91798751,
                    ["⛏️ Mineral"] = 924894801,
                    ["⚗️ Bahan Kimia"] = 1587235432,
                    ["📦 Tekstil"] = 1147903624
                }
            },
            {
                name = "🔱 Level 2",
                mapping = {
                    ["⛓️ Besi"] = 1965976283,
                    ["🌴 Kayu"] = 1736317037,
                    ["🔁 Plastik"] = 1692935227,
                    ["🌱 Benih"] = 91798752,
                    ["⛏️ Mineral"] = 924894802,
                    ["⚗️ Bahan Kimia"] = 1587235433,
                    ["📦 Tekstil"] = 1147903625
                }
            },
            {
                name = "🔱 Level 3",
                mapping = {
                    ["⛓️ Besi"] = 1965976284,
                    ["🌴 Kayu"] = 1736317038,
                    ["🔁 Plastik"] = 1692935228,
                    ["🌱 Benih"] = 91798753,
                    ["⛏️ Mineral"] = 924894803,
                    ["⚗️ Bahan Kimia"] = 1587235434,
                }
            }
        }
    }
    local function ShowConversionWarning(mappingData, categoryType)
        local warningMsg = "⬇️ Barang Yang Akan Diubah ⬇️\n\n"
        local targetNames = {
        warGoods = {
            [253271711] = "⚒️ Anvil",
            [860715237] = "🚒 Hidran Kebarakan",
            [1560176023] = "🔭 Teropong",
            [352219700] = "🔧 Tang",
            [-1607480754] = "⛸️ Sepatu Kuning",
            [-1247109630] = "🚽 Penyedot WC",
            [-1540742631] = "📢 Pengeras Suara",
            [-916988905] = "⛽ Jerigen Bensin",
            [2090081903] = "🎯 Kotak Peluru",
            [226338627] = "🏣 Kotak P3K"
        },
        warCards = {
            [1430583743] = "✋ Hand Comics",
            [1430583746] = "📏 Shrink Ray",
            [-35376651] = "🗻 Giant Rock Monsters",
            [1430583747] = "🌪️ Not In Kansas",
            [1430583749] = "🔩 Magnetism",
            [1430583748] = "🐙 Tentacle Vortex",
            [-35376655] = "🤖 Flying Vu Robot",
            [-35376689] = "🎵 Disco Twister",
            [-35376688] = "🌿 Plant Monster",
            [1430583750] = "❄️ Blizzaster",
            [-35376685] = "🐟 Fishaster",
            [-35376684] = "📜 Ancient Curse",
            [1430583751] = "🖐️ Hands Of Doom",
            [-35376683] = "🏗️ 16 Tons",
            [-35376680] = "🕷️ Spiders",
            [-35376687] = "⛸️ Dance Shoes",
            [-35376681] = "🏢 Building Portal",
            [-35376654] = "👾 B Movie Monster",
            [-35376648] = "🐍 Hissy Fit",
            [-35376647] = "📢 Mellow Bellow",
            [-35376650] = "🦆 Doomsday Quack",
            [-35376649] = "⚡ Electric Deity",
            [-35376623] = "🛡️ Shield Buster",
            [-35376622] = "🍋 Zest From Above"
        },
        pelesat = {
            [1965976282] = "⚡ Energy Pump Level 1",
            [1736317036] = "⚫ Negative Energy Level 1",
            [1692935226] = "🎰 Jackpot Level 1",
            [91798751]   = "💣 DuD Level 1",
            [924894801]  = "❄️ Freeze Level 1",
            [1587235432] = "☂️ Umbrella Level 1",
            [1147903624] = "🕵 Thief Level 1",
            [1965976283] = "⚡ Energy Pump Level 2",
            [1736317037] = "⚫ Negative Energy Level 2",
            [1692935227] = "🎰 Jackpot Level 2",
            [91798752]   = "💣 DuD Level 2",
            [924894802]  = "❄️ Freeze Level 2",
            [1587235433] = "☂️ Umbrella Level 2",
            [1147903625] = "🕵 Thief Level 2",
            [1965976284] = "⚡ Energy Pump Level 3",
            [1736317038] = "⚫ Negative Energy Level 3",
            [1692935228] = "🎰 Jackpot Level 3",
            [91798753]   = "💣 DuD Level 3",
            [924894803]  = "❄️ Freeze Level 3",
            [1587235434] = "☂️ Umbrella Level 3"
        }
    }
    for baseItem, targetValue in pairs(mappingData) do
        local targetName = targetNames[categoryType][targetValue] or "🔓 Upgrade / Unlock 🔓"
        warningMsg = warningMsg .. string.format("%s ➡️ %s\n", baseItem, targetName) end
        warningMsg = warningMsg .. "\n⚠️ Apakah Kamu Yakin? ⚠️"
        return gg.alert(warningMsg, "✅ Lanjutkan", "⬅️ Batalkan")
    end
    local function ProcessEdit(baseItemName, targetValue)
        local originalValue = WarData.baseItems[baseItemName]
        if not originalValue then
            gg.alert("⚫ Error Ketika Mencari Barang Utama, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            return false
        end
        gg.searchNumber(originalValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(200)
        if #results == 0 then
            gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            return false
        end
        gg.editAll(targetValue, gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast("⚪ " .. baseItemName .. " Berhasil ⚪")
        return true
    end
    local menuTitles = updateMainMenuTitles()
    
    local mainMenu = gg.choice({
        menuTitles.warGoods,
        menuTitles.warCards,
        menuTitles.pelesat,
        "⬅️ Kembali"
    }, nil, "⚔️ Ger Simplicity v2.9 Menu Perang ⚔️")
    if mainMenu == 1 then
        local submenu = {}
        for i, v in ipairs(WarData.warGoods) do
            local prefix = GerSimplicityUsedFeatures.warGoods[i] and " ✅ " or ""
            submenu[i] = prefix .. v.name
        end
        submenu[#submenu+1] = "⬅️ Kembali"
        
        local choice = gg.choice(submenu, nil, "⚒️ Pilih Kombinasi Barang Perang ⚒️")
        if not choice or choice == #submenu then
            return GerSimplicityPerang()
        end
        if GerSimplicityUsedFeatures.warGoods[choice] then
            gg.alert("⚠️ Fitur Ini Sudah Kamu Gunakan, Restart Game Terlebih Dahulu Untuk Mencegah Hal Yang Tidak Di Inginkan Terjadi ⚠️")
            return GerSimplicityPerang()
        end
        
        local selected = WarData.warGoods[choice]
        local confirm = ShowConversionWarning(selected.mapping, "warGoods")
        if confirm ~= 1 then
            gg.alert("⚫ Kamu Memilih Batal ⚫")
            return GerSimplicityPerang()
        end
        
        for baseItem, targetValue in pairs(selected.mapping) do
            if not ProcessEdit(baseItem, targetValue) then
                gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            end
        end
        GerSimplicityUsedFeatures.warGoods[choice] = true
        gg.toast("⚪ ⚒️ Simplicity Barang Perang Berhasil ⚒️ ⚪")
        gg.alert("⚪ Barang Berhasil Diubah, Restart Game Untuk Melihat Perubahannya ⚪")
    elseif mainMenu == 2 then
        local submenu = {}
        for i, v in ipairs(WarData.warCards) do
            local prefix = GerSimplicityUsedFeatures.warCards[i] and " ✅ " or ""
            submenu[i] = prefix .. v.name
        end
        submenu[#submenu+1] = "⬅️ Kembali"
        
        local choice = gg.choice(submenu, nil, "🔰 Pilih Kelas Kartu Perang 🔰")
        if not choice or choice == #submenu then
            return GerSimplicityPerang()
        end
        if GerSimplicityUsedFeatures.warCards[choice] then
            gg.alert("⚠️ Fitur Ini Sudah Kamu Gunakan, Restart Game Terlebih Dahulu Untuk Mencegah Hal Yang Tidak Di Inginkan Terjadi ⚠️")
            return GerSimplicityPerang()
        end
        
        local selected = WarData.warCards[choice]
        local confirm = ShowConversionWarning(selected.mapping, "warCards")
        if confirm ~= 1 then
            gg.alert("⚫ Kamu Memilih Batal ⚫")
            return GerSimplicityPerang()
        end
        
        for baseItem, targetValue in pairs(selected.mapping) do
            if not ProcessEdit(baseItem, targetValue) then
                gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            end
        end
        GerSimplicityUsedFeatures.warCards[choice] = true
        gg.toast("⚪ 🔰 Simplicity Kartu Perang Berhasil 🔰 ⚪")
        gg.alert("⚪ Barang Berhasil Diubah, Restart Game Untuk Melihat Perubahannya ⚪")
    elseif mainMenu == 3 then
        local submenu = {}
        for i, v in ipairs(WarData.pelesat) do
            local prefix = GerSimplicityUsedFeatures.pelesat[i] and " ✅ " or ""
            submenu[i] = prefix .. v.name
        end
        submenu[#submenu+1] = "⬅️ Kembali"
        
        local choice = gg.choice(submenu, nil, "🔱 Pilih Level Pelesat 🔱")
        if not choice or choice == #submenu then
            return GerSimplicityPerang()
        end
        if GerSimplicityUsedFeatures.pelesat[choice] then
            gg.alert("⚠️ Fitur Ini Sudah Kamu Gunakan, Restart Game Terlebih Dahulu Untuk Mencegah Hal Yang Tidak Di Inginkan Terjadi ⚠️")
            return GerSimplicityPerang()
        end
        
        local selectedLevel = WarData.pelesat[choice]
        local confirm = ShowConversionWarning(selectedLevel.mapping, "pelesat")
        if confirm ~= 1 then
            gg.alert("⚫ Kamu Memilih Batal ⚫")
            return GerSimplicityPerang()
        end
        for baseItem, targetValue in pairs(selectedLevel.mapping) do
            if not ProcessEdit(baseItem, targetValue) then
                gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            end
        end
        GerSimplicityUsedFeatures.pelesat[choice] = true
        gg.toast("⚪ 🔱 Simplicity Pelesat Perang Berhasil 🔱 ⚪")
        gg.alert("⚪ Barang Berhasil Diubah, Restart Game Untuk Melihat Perubahannya ⚪")
    elseif mainMenu == 4 then
        return GerSimplicity()
    end
    return GerSimplicityPerang()
end

function GerSimplicityBangunan()
    gg.setVisible(false)
    gg.clearResults()
    
    local GSBangunanData = {
        baseItems = {
            ["⛓️ Besi"] = 267176888,
            ["🌴 Kayu"] = 2090874750,
            ["🔁 Plastik"] = -1270634091,
            ["🌱 Benih"] = 274276185,
            ["⛏️ Mineral"] = -1369888960
            -- Mutlak, Tidak Boleh Diubah Ubah
        },
        GSBangunan = {
            -- Ger Simplicity 🤖 Super Service, Stasiun, Maxis
            ["🧯 Super Service Kantor Pusat Pemadam Kebakaran"] = 1840116317,
            ["🚨 Super Service Markas Besar Polisi"] = -898048097,
            ["🏥 Super Service Pusat Medis"] = 850245360,
            ["🚉 Stasiun Pusat"] = -282846133,
            ["🤖 Puri Maxis"] = 925375395,
            -- Ger Simplicity 🤖 Pembangkit Omega, Markas Maxis
            ["⚡️ Pembangkit Listrik Omega"] = -857301703,
            ["💧 Tower Air Omega"] = -1257426322,
            ["♻️ Pusat Daur Ulang Omega"] = -535421151,
            ["🚽 Pipa Aliran Pengolahan Limbah Omega"] = -212043960,
            ["🤖 Markas Maxis"] = 1579400415,
            -- Ger Simplicity 🌱 Layanan Regional
            ["🥗 Pasar Makanan Organik Deluxe"] = -373820456,
            ["🛄 Pusat Pariwisata Mewah"] = 1883643952,
            ["🌡️ Pemanas Tumbuhan Deluxe"] = -774727411,
            ["⛽ Stasiun Gas Deluxe"] = -310535061,
            ["☕ Pusat Pasar Makanan Kaki 5"] = 2135864390,
            -- Ger Simplicity 🏜️ Regional Berlevel 🗿 Patung
            ["🏜️ Kasino Oasis Max"] = -40960756,
            ["🍵 Rumah Minum Teh Max"] = -1053961458,
            ["🏛️ Institut Riset Cahaya Utara Max"] = -61527945,
            ["🚖 Perhentian Taksi Max"] = 776814664,
            ["🗿 Patung Walikota Terhebat"] = 2040088750,
            -- Ger Simplicity 🏙️ Pencakar Langit
            ["💎 Zamrud"] = -1290779205,
            ["🥇 Emas"] = -1802872902,
            ["🌫️ Kabut"] = -363029219,
            ["🔑 Kunci Emas"] = 1736540863,
            ["🔐 Kunci Platinum"] = 1100779520
        }
    }
    
    local GSBangunanMapping = {
        {
            name = "🤖 Super Service, Stasiun, Maxis",
            mapping = {
                ["⛓️ Besi"] = 1840116317,
                ["🌴 Kayu"] = -898048097,
                ["🔁 Plastik"] = 850245360,
                ["🌱 Benih"] = 925375395,
                ["⛏️ Mineral"] = -282846133
            }
        },
        {
            name = "🤖 Pembangkit Omega, Markas Maxis",
            mapping = {
                ["⛓️ Besi"] = -857301703,
                ["🌴 Kayu"] = -1257426322,
                ["🔁 Plastik"] = -535421151,
                ["🌱 Benih"] = -212043960,
                ["⛏️ Mineral"] = 1579400415
            }
        },
        {
            name = "🌱 Layanan Regional",
            mapping = {
                ["⛓️ Besi"] = -373820456,
                ["🌴 Kayu"] = 1883643952,
                ["🔁 Plastik"] = -774727411,
                ["🌱 Benih"] = -310535061,
                ["⛏️ Mineral"] = 2135864390
            }
        },
        {
            name = "🏜️ Regional Berlevel 🗿 Patung",
            mapping = {
                ["⛓️ Besi"] = -40960756,
                ["🌴 Kayu"] = -1053961458,
                ["🔁 Plastik"] = -61527945,
                ["🌱 Benih"] = 776814664,
                ["⛏️ Mineral"] = 2040088750
            }
        },
        {
            name = "🏙️ Pencakar Langit",
            mapping = {
                ["⛓️ Besi"] = -1290779205,
                ["🌴 Kayu"] = -1802872902,
                ["🔁 Plastik"] = -363029219,
                ["🌱 Benih"] = 1736540863,
                ["⛏️ Mineral"] = 1100779520
            }
        }
    }
    
    local function ShowConversionWarning(mappingData, categoryType)
        local warningMsg = "⬇️ Barang Yang Akan Diubah ⬇️\n\n"
        local targetNames = {
            GSBangunan = {
                [1840116317] = "🧯 Super Service Kantor Pusat Pemadam Kebakaran",
                [-898048097] = "🚨 Super Service Markas Besar Polisi",
                [850245360] = "🏥 Super Service Pusat Medis",
                [-282846133] = "🚉 Stasiun Pusat",
                [1579400415] = "🤖 Markas Maxis",
                [-857301703] = "⚡️ Pembangkit Listrik Omega",
                [-1257426322] = "💧 Tower Air Omega",
                [-535421151] = "♻️ Pusat Daur Ulang Omega",
                [-212043960] = "🚽 Pipa Aliran Pengolahan Limbah Omega",
                [925375395] = "🤖 Puri Maxis",
                [-373820456] = "🥗 Pasar Makanan Organik Deluxe",
                [1883643952] = "🛄 Pusat Pariwisata Mewah",
                [-774727411] = "🌡️ Pemanas Tumbuhan Deluxe",
                [-310535061] = "⛽ Stasiun Gas Deluxe",
                [2135864390] = "☕ Pusat Pasar Makanan Kaki 5",
                [-40960756] = "🏜️ Kasino Oasis Max",
                [-1053961458] = "🍵 Rumah Minum Teh Max",
                [-61527945] = "🏛️ Institut Riset Cahaya Utara Max",
                [776814664] = "🚖 Perhentian Taksi Max",
                [2040088750] = "🗿 Patung Walikota Terhebat",
                [-1290779205] = "💎 Zamrud",
                [-1802872902] = "🥇 Emas",
                [-363029219] = "🌫️ Kabut",
                [1736540863] = "🔑 Kunci Emas",
                [1100779520] = "🔐 Kunci Platinum"
            }
        }
        for baseItem, targetValue in pairs(mappingData) do
            local targetName = targetNames[categoryType][targetValue] or "🔓 Upgrade / Unlock 🔓"
            warningMsg = warningMsg .. string.format("%s ➡️ %s\n", baseItem, targetName)
        end
        warningMsg = warningMsg .. "\n⚠️ Apakah Kamu Yakin? ⚠️"
        return gg.alert(warningMsg, "✅ Lanjutkan", "⬅️ Kembali")
    end
    
    local function ProcessEdit(baseItemName, targetValue)
        local originalValue = GSBangunanData.baseItems[baseItemName]
        if not originalValue then
            gg.alert("⚫ Error Ketika Mencari Barang Utama, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            return false
        end
        gg.searchNumber(originalValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(200)
        if #results == 0 then
            gg.alert("⚫ Error Ketika Mengubah Barang Menjadi Bangunan, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
            return false
        end
        gg.editAll(targetValue, gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast("⚪ " .. baseItemName .. " Berhasil ⚪")
        return true
    end
    
    local submenu = {}
    for i, v in ipairs(GSBangunanMapping) do
        local prefix = GerSimplicityUsedFeatures.GSBangunan[i] and " ✅ " or ""
        submenu[i] = prefix .. v.name
    end
    submenu[#submenu+1] = "🔙 Kembali"
    
    local choice = gg.choice(submenu, nil, "🎮 Ger Simplicity v2.9 Services 🎮")
    if not choice or choice == #submenu then
        return GerSimplicity()
    end
    
    if GerSimplicityUsedFeatures.GSBangunan[choice] then
        gg.alert("⚠️ Fitur Ini Sudah Kamu Gunakan, Restart Game Terlebih Dahulu Untuk Mencegah Hal Yang Tidak Di Inginkan Terjadi ⚠️")
        return GerSimplicityBangunan()
    end
    
    local selected = GSBangunanMapping[choice]
    local confirm = ShowConversionWarning(selected.mapping, "GSBangunan")
    if confirm ~= 1 then
        gg.toast("⚫ Kamu Memilih Batal ⚫")
        return GerSimplicityBangunan()
    end
    
    for baseItem, targetValue in pairs(selected.mapping) do
        if not ProcessEdit(baseItem, targetValue) then
            gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
        end
    end
    
    GerSimplicityUsedFeatures.GSBangunan[choice] = true
    gg.toast("⚪ Fitur Simplicity ➡️ " .. selected.name .. " Berhasil ⚪")
    gg.alert("⚪ Fitur Simplicity ➡️ " .. selected.name .. " Berhasil, Restart Game Untuk Menerapkan Fitur ⚪")
    return GerSimplicity()
end

function GerSimplicityEarly()
    gg.setVisible(false)
    gg.clearResults()
    
    local GSEarlyGameData = {
        BaseBangunan = {
            ["🏬 Menara Vu"] = 2019791904,
            ["🏬 Neo Mall"] = 424671600,
            ["🏭 Pabrik Kecil"] = 612373322,
            ["💧 Tower Air"] = 139346164,
            ["⚡️ Listrik Batu Bara"] = -1297331478
        },
        GSEarlyGame = {
            -- Ger Simplicity Early Game
            ["🔓 Level Max"] = 1362697172,
            ["🔓 Terbuka"] = 2087261488,
            ["🏭 Pabrik Nano"] = 734850349,
            ["💧 Tower Air Omega"] = -1257426322,
            ["⚡️ Pembangkit Listrik Omega"] = -857301703
        }
    }
    
    local GSEarlyGameMapping = {
        {
            name = "🚀 Paket Neo Vu Early",
            mapping = {
                ["🏬 Menara Vu"] = 1362697172,
                ["🏬 Neo Mall"] = 2087261488,
                ["🏭 Pabrik Kecil"] = 734850349,
                ["💧 Tower Air"] = -1257426322,
                ["⚡️ Listrik Batu Bara"] = -857301703
            }
        }
    }
    
    local function ShowConversionWarning(mappingData, categoryType)
        local warningMsg = "⬇️ Barang Yang Akan Diubah ⬇️\n\n"
        local targetNames = {
            GSEarlyGame = {
                [1840116317] = "🔓 Level Max",
                [-898048097] = "🔓 Terbuka",
                [734850349] = "🏭 Pabrik Nano",
                [-1257426322] = "💧 Tower Air Omega",
                [-857301703] = "⚡️ Pembangkit Listrik Omega"
            }
        }
        for baseItem, targetValue in pairs(mappingData) do
            local targetName = targetNames[categoryType][targetValue] or "🔓 Upgrade / Unlock 🔓"
            warningMsg = warningMsg .. string.format("%s ➡️ %s\n", baseItem, targetName)
        end
        warningMsg = warningMsg .. "\n⚠️ Apakah Kamu Yakin? ⚠️"
        return gg.alert(warningMsg, "✅ Lanjutkan", "⬅️ Kembali")
    end
    
    local function ProcessEdit(baseItemName, targetValue)
        local originalValue = GSEarlyGameData.BaseBangunan[baseItemName]
        if not originalValue then
            gg.alert("⚫ Error: Barang utama tidak ditemukan. Restart game atau hubungi developer. ⚫")
            return false
        end
        local targetNames = {
            [1362697172] = "🔓 Level Max",
            [2087261488] = "🔓 Terbuka",
            [734850349] = "🏭 Pabrik Nano",
            [-1257426322] = "💧 Tower Air Omega",
            [-857301703] = "⚡️ Pembangkit Listrik Omega"
        }
        local targetName = targetNames[targetValue] or "🔓 Upgrade / Unlock 🔓"
        gg.searchNumber(originalValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(200)
        if #results == 0 then
            gg.alert("⚫ Error: Barang tidak ditemukan dalam memori. Restart game atau hubungi developer. ⚫")
            return false
        end
        gg.editAll(targetValue, gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast("⚪ " .. baseItemName .. " Menjadi " .. targetName .. " Berhasil ⚪")
        return true
    end
    
    local submenu = {}
    for i, v in ipairs(GSEarlyGameMapping) do
        local prefix = GerSimplicityUsedFeatures.GSEarlyGame[i] and " ✅ " or ""
        submenu[i] = prefix .. v.name
    end
    submenu[#submenu+1] = "🔙 Kembali"
    
    local choice = gg.choice(submenu, nil, "🛒 Ger Simplicity v2.9 Early Game 🛒")
    if not choice or choice == #submenu then
        return GerSimplicity()
    end
    
    if GerSimplicityUsedFeatures.GSEarlyGame[choice] then
        gg.alert("⚠️ Fitur Ini Sudah Kamu Gunakan, Restart Game Terlebih Dahulu Untuk Mencegah Hal Yang Tidak Di Inginkan Terjadi ⚠️")
        return GerSimplicityEarly()
    end
    
    local selected = GSEarlyGameMapping[choice]
    local confirm = ShowConversionWarning(selected.mapping, "GSEarlyGame")
    if confirm ~= 1 then
        gg.alert("⚫ Kamu Memilih Batal ⚫")
        return GerSimplicityEarly()
    end
    
    for baseItem, targetValue in pairs(selected.mapping) do
        if not ProcessEdit(baseItem, targetValue) then
            gg.alert("⚫ Error Ketika Mengubah Barang, Restart Game / Hubungi Dev Untuk Lebih Lanjut ⚫")
        end
    end
    
    GerSimplicityUsedFeatures.GSEarlyGame[choice] = true
    gg.alert("⚪ Barang Berhasil Diubah, Restart Game Untuk Melihat Perubahannya ⚪")
    return GerSimplicity()
end

local GerSimplicityMenuUtama = {
    "⚔️ SimpliWars ⚔️", 
    "🎮 SimpliServices 🎮",
    "🛒 Early Game 🛒",
    "⬅️ Kembali"
}

function GerSimplicity()
    while true do
        gg.setVisible(false)
        local GPOU = gg.choice(GerSimplicityMenuUtama, nil, "⚪ Ger Simplicity v2.9 ⚪")
        if GPOU == nil then
            gg.toast("🕊️ Script Berjalan Di Latar Belakang, Buka GG Untuk Menggunakannya Kembali 🕊️")
            while true do
                if gg.isVisible(true) then
                    gg.setVisible(false)
                    break
                end
            end
        else
            if GPOU == 4 then
                GerSimplicity()
                break
            elseif GPOU == 1 then
                GerSimplicityPerang()
            elseif GPOU == 2 then
                GerSimplicityBangunan()
            elseif GPOU == 3 then
                GerSimplicityEarly()
            end
        end
    end
end

function GerOut()
    gg.clearResults()
    local GerOutKonfir = gg.alert("⚠️ Kamu Yakin Mau keluar Dari Ger All In One Scripts? ⚠️", "✅️ Keluar", "⬅️ Kembali")
    if GerOutKonfir == 1 then
        gg.toast("🕊️ Script Keluar, By BageRun, 083874062329 🕊️")
        os.exit()
    elseif GerOutKonfir == 2 then
        return GerSimplicity()
    end
end

GerSimplicity()