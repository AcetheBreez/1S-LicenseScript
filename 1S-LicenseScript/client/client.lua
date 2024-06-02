QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
 end

-- Main Menu 
lib.registerContext({
	id = 'Licensemenu',
	title = 'Victorian Gun Licenses',
	onExit = function()
		ExecuteCommand('e c')
	end,
	options = {
	  {
		title = 'Concealed Gun License ($75,000)',
		icon = 'fa-id-card',
        event = 'GunLicensee',
	},
	  {
		title = 'Open Carry Gun License ($110,000)',
		icon = 'fa-id-card',
		event = 'openGunLicensee',
	  },
	  {
		title = 'Hunting License ($50,000)',
		icon = 'fa-id-card',
		event = 'HuntingLicensee',
	  },
	}
  })


  exports.ox_target:addSphereZone({
    coords = vector3(18.97, -1107.59, 30.1), -- configurable Vector3
    radius = 1,
    options = {
		{
			icon = 'fa-solid fa-id-card',
			label = 'Licenseing',
			onSelect = function()
				ExecuteCommand('e tablet2')
				lib.showContext('Licensemenu')
			end
        },
		
    }
})

  local coords = vector3(18.94, -1107.44, 29.8) -- Coordinates where players can open the menu

  -- Function to check if the player is near the coordinates
  function IsNearCoords(coords, radius)
	  local pos = GetEntityCoords(PlayerPedId())
	  return #(pos - coords) <= radius
  end
  
  -- Main thread to handle menu opening
  CreateThread(function()
	  while true do
		  Wait(0) -- Adjust the Wait time as necessary
		  
		  -- Check if the player is near the coordinates and not already drawing the notification
		  if IsNearCoords(coords, 2) and not textDrawn then
			lib.notify({
				description = 'Alt Eye To Open Weapon Licensing',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#0CA678', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'success',
				iconColor = '#B2F2BB' 
			})
			  textDrawn = true
		  end
		end
		end)

  local pedCoords = vector4(18.76, -1107.45, 29.8, 221.59) -- were the ped stands
  RequestModel('s_m_m_chemsec_01')
  while not HasModelLoaded('s_m_m_chemsec_01') do Wait(0) end
  local deliveryPed = CreatePed(0, 's_m_m_chemsec_01', pedCoords.x, pedCoords.y, pedCoords.z - 1.0, pedCoords.w, false, false)
  FreezeEntityPosition(deliveryPed, true)
  SetEntityInvincible(deliveryPed, true)
  SetBlockingOfNonTemporaryEvents(deliveryPed, true)
		



-- Main Event Of Concealed License
RegisterNetEvent('GunLicensee', function(args)
	local concealedalertbuylicense = lib.alertDialog({
		header = 'Victorian Goverment',
		content = 'Are You Sure You Want To Buy A Concealed Firearms License ($75,000)?',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Sign Document',
		}
	})
	if concealedalertbuylicense == 'cancel' then ExecuteCommand ("e c") return end


	lib.progressBar({
		duration = 2000,
		label = 'Signing Legal Document',
		useWhileDead = false,
		canCancel = true,
	})

    lib.notify({
        description = 'Now You Will Start Your Exam',
        showDuration = true,
        position = 'top',
        style = {
            backgroundColor = '#0CA678', 
            color = '#FFFFFF', 
            ['.description'] = {
                color = '#FFFFFF' 
            }
        },
        type = 'success',
        iconColor = '#B2F2BB' 
    })



	local input = lib.inputDialog('It is illegal to shoot:', {
		{type = 'checkbox', label = 'Across a road'},
		{type = 'checkbox', label = 'On to a road'},
		{type = 'checkbox', label = 'All Above'},
	  })

	  if input[1] == false and input[2] == false and input[3] == true then
	else
		
		lib.notify({
			description = 'You Got It Wrong!',
			showDuration = true,
			position = 'top',
			style = {
				backgroundColor = '#FF8484', 
				color = '#FFFFFF', 
				['.description'] = {
					color = '#FFFFFF' 
				}
			},
			type = 'error',
			iconColor = '#FF1616' 
		})
		return end


		local input = lib.inputDialog('To shoot safely you must know:', {
			{type = 'checkbox', label = 'Your Target'},
			{type = 'checkbox', label = 'What is beyond the target'},
			{type = 'checkbox', label = 'Your targets surrounding'},
			{type = 'checkbox', label = 'All of the above'},
		  })
	
		  if input[1] == false and input[2] == false and input[3] == false and input[4] == true then
			lib.notify({
				description = 'You Finished The Test',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#0CA678', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'success',
				iconColor = '#B2F2BB' 
			})
		else
			
			lib.notify({
				description = 'You Got It Wrong!',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#FF8484', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'error',
				iconColor = '#FF1616' 
			})
			return end


	local concealedalertintro = lib.alertDialog({
		header = 'Introduction',
		content = 'Obtaining a firearms license in Victoria is a regulated process governed by state laws aimed at ensuring the responsible ownership and usage of firearms. This document provides an overview of the requirements and procedures for obtaining a gun license in Victoria.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if concealedalertintro == 'cancel' then ExecuteCommand ("e c") return end

	local concealedalertpenaltiessss = lib.alertDialog({
		header = 'Penalties',
		content = 'Vilolation of Acts May Result In Fines, Or Suspension even revocation of the Weapon license depending on the offense. UnAuthorized Carrying Of Leathal Weapon In State Of Public Places May Have Severe Penalties.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'I Agree',
		}
	})
	if concealedalertpenaltiessss == 'cancel' then ExecuteCommand ("e c") return end

	local concealedalerteligible = lib.alertDialog({
		header = 'Eligible For A Gun License',
		content = 'Applicants must be at least 18 years old to apply for a firearm license. Applicants must have a genuine reason for owning a firearm, which may include recreational shooting, hunting, primary production, pest control, or occupational reasons such as security work.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if concealedalerteligible == 'cancel' then ExecuteCommand ("e c") return end

	local concelaedalertresponsiblities = lib.alertDialog({
		header = 'Responsiblities Of A GunLicense',
		content = 'Once granted, firearms license holders in Victoria have several responsibilities, including: Safe Storage: Firearms must be stored securely in compliance with regulations to prevent unauthorized access. Regular Renewal: Licenses must be renewed periodically, usually every five years, to ensure continued eligibility and compliance with regulations. Notification of Changes: License holders must inform Victoria Police of any changes in circumstances, such as change of address or medical conditions. Compliance with Laws: License holders must adhere to all relevant firearms laws and regulations, including restrictions on where and how firearms can be used.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if concelaedalertresponsiblities == 'cancel' then ExecuteCommand ("e c") return end

	local concealedalertconlusion = lib.alertDialog({
		header = 'Conclusion',
		content = 'Obtaining a gun license in Victoria requires applicants to meet stringent criteria and undergo thorough assessments to ensure the safe and responsible ownership of firearms. By following the prescribed process and adhering to regulations, individuals can enjoy the privileges of firearm ownership while contributing to public safety and security.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'I Agree',
		}
	})
	if concealedalertconlusion == 'cancel' then ExecuteCommand ("e c") return end

	lib.progressBar({
		duration = 2000,
		label = 'Checking Background',
		useWhileDead = false,
		canCancel = true,
	})
	lib.progressBar({
		duration = 2000,
		label = 'Checking Criminal Record',
		useWhileDead = false,
		canCancel = true,
	})
	lib.progressBar({
		duration = 2000,
		label = 'Checking Balance',
		useWhileDead = false,
		canCancel = true,
	})
	TriggerServerEvent('concealedlicensefirearms')	 
	ExecuteCommand ("e c")
end)





-- Open Carry Event
RegisterNetEvent('openGunLicensee', function(args)
	local opencarryalertbuylicense = lib.alertDialog({
		header = 'Victorian Goverment',
		content = 'Are You Sure You Want To Purchase Open Carry Firearms License ($110,000)?',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Sign Document',
		}
	})
	if opencarryalertbuylicense == 'cancel' then ExecuteCommand ("e c") return end

	lib.progressBar({
		duration = 2000,
		label = 'Signing Legal Document',
		useWhileDead = false,
		canCancel = true,
	})

    lib.notify({
        description = 'Now You Will Start Your Exam',
        showDuration = true,
        position = 'top',
        style = {
            backgroundColor = '#0CA678', 
            color = '#FFFFFF', 
            ['.description'] = {
                color = '#FFFFFF' 
            }
        },
        type = 'success',
        iconColor = '#B2F2BB' 
    })
	
	local input = lib.inputDialog('It is illegal to shoot:', {
		{type = 'checkbox', label = 'Across a road'},
		{type = 'checkbox', label = 'On to a road'},
		{type = 'checkbox', label = 'All Above'},
	  })

	  if input[1] == false and input[2] == false and input[3] == true then
	else
		
		lib.notify({
			description = 'You Got It Wrong!',
			showDuration = true,
			position = 'top',
			style = {
				backgroundColor = '#FF8484', 
				color = '#FFFFFF', 
				['.description'] = {
					color = '#FFFFFF' 
				}
			},
			type = 'error',
			iconColor = '#FF1616' 
		})
		return end


		local input = lib.inputDialog('To shoot safely you must know:', {
			{type = 'checkbox', label = 'Your Target'},
			{type = 'checkbox', label = 'What is beyond the target'},
			{type = 'checkbox', label = 'Your targets surrounding'},
			{type = 'checkbox', label = 'All of the above'},
		  })
	
		  if input[1] == false and input[2] == false and input[3] == false and input[4] == true then
			lib.notify({
				description = 'You Finished The Test',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#0CA678', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'success',
				iconColor = '#B2F2BB' 
			})
		else
			
			lib.notify({
				description = 'You Got It Wrong!',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#FF8484', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'error',
				iconColor = '#FF1616' 
			})
			return end
	

	local openalertintroo = lib.alertDialog({
		header = 'Introduction',
		content = 'Obtaining a firearms license in Victoria is a regulated process governed by state laws aimed at ensuring the responsible ownership and usage of firearms. This document provides an overview of the requirements and procedures for obtaining a gun license in Victoria.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if openalertintroo == 'cancel' then ExecuteCommand ("e c") return end

	local opencarryalertelliglee = lib.alertDialog({
		header = 'Eligible For A Gun License',
		content = 'Applicants must be at least 18 years old to apply for a firearm license. Applicants must have a genuine reason for owning a firearm, which may include recreational shooting, hunting, primary production, pest control, or occupational reasons such as security work.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if opencarryalertelliglee == 'cancel' then ExecuteCommand ("e c") return end

	local opencarryalertpenalties = lib.alertDialog({
		header = 'Penalties',
		content = 'Vilolation of Acts May Result In Fines, Or Suspension even revocation of the weapon license depending on the offense.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if opencarryalertpenalties == 'cancel' then ExecuteCommand ("e c") return end


	local opencarryalertrespon = lib.alertDialog({
		header = 'Responsiblities Of A GunLicense',
		content = 'Responsibilities of License Holders: Once granted, firearm license holders in Victoria have several responsibilities, including: Safe Storage: Firearms must be stored securely in compliance with regulations to prevent unauthorized access. Regular Renewal: Licenses must be renewed periodically, usually every five years, to ensure continued eligibility and compliance with regulations. Notification of Changes: License holders must inform Victoria Police of any changes in circumstances, such as change of address or medical conditions. Compliance with Laws: License holders must adhere to all relevant firearms laws and regulations, including restrictions on where and how firearms can be used.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})
	if opencarryalertrespon == 'cancel' then ExecuteCommand ("e c") return end
	local opencarryalert = lib.alertDialog({
		header = 'Conclusion',
		content = 'Obtaining a gun license in Victoria requires applicants to meet stringent criteria and undergo thorough assessments to ensure the safe and responsible ownership of firearms. By following the application process and adhering to regulations, individuals can enjoy the privileges of firearm ownership while contributing to public safety and security.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'I Agree',
		}
	})
	if opencarryalert == 'cancel' then ExecuteCommand ("e c") return end


	lib.progressBar({
		duration = 2000,
		label = 'Checking Background',
		useWhileDead = false,
		canCancel = true,
	})
	lib.progressBar({
		duration = 2000,
		label = 'Checking Criminal Background',
		useWhileDead = false,
		canCancel = true,
	})
	lib.progressBar({
		duration = 2000,
		label = 'Checking Balance',
		useWhileDead = false,
		canCancel = true,
	})

		TriggerServerEvent('opencarrylicensefirarm')
	ExecuteCommand ("e c")
end)
		






-- Hunting License
RegisterNetEvent('HuntingLicensee', function(args)
	local alertbuylicense = lib.alertDialog({
		header = 'Victorian Goverment',
		content = 'Are You Sure You Want To Purchase A Hunting License ($50,000)',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Sign Document',
		}
	})
	if alertbuylicense == 'cancel' then ExecuteCommand ("e c") return end
	
	


	lib.progressBar({
		duration = 2000,
		label = 'Signing Legal Document',
		useWhileDead = false,
		canCancel = true,
	})

    lib.notify({
        description = 'Now You Will Start Your Exam',
        showDuration = true,
        position = 'top',
        style = {
            backgroundColor = '#0CA678', 
            color = '#FFFFFF', 
            ['.description'] = {
                color = '#FFFFFF' 
            }
        },
        type = 'success',
        iconColor = '#B2F2BB' 
    })


		local input = lib.inputDialog('To shoot safely you must know:', {
			{type = 'checkbox', label = 'Your Target'},
			{type = 'checkbox', label = 'What is beyond the target'},
			{type = 'checkbox', label = 'Your targets surrounding'},
			{type = 'checkbox', label = 'All of the above'},
		  })
	
		  if input[1] == false and input[2] == false and input[3] == false and input[4] == true then
			lib.notify({
				title = 'You Got It Right!',
				position = 'top',
				description = 'Well Done',
				type = 'success'
			})
		else
			
			lib.notify({
				description = 'You Got It Wrong!',
				showDuration = true,
				position = 'top',
				style = {
					backgroundColor = '#FF8484', 
					color = '#FFFFFF', 
					['.description'] = {
						color = '#FFFFFF' 
					}
				},
				type = 'error',
				iconColor = '#FF1616' 
			})
			return end

			local input = lib.inputDialog('Where do you do hunting at:', {
				{type = 'checkbox', label = 'Across a road'},
				{type = 'checkbox', label = 'On a highway'},
				{type = 'checkbox', label = 'On Mountains where zones are set'},
			  })
		
			  if input[1] == false and input[2] == false and input[3] == true then
				lib.notify({
					description = 'You Finished The Test!',
					showDuration = true,
					position = 'top',
					style = {
						backgroundColor = '#0CA678', 
						color = '#FFFFFF', 
						['.description'] = {
							color = '#FFFFFF' 
						}
					},
					type = 'success',
					iconColor = '#B2F2BB' 
				})
			else
				
				lib.notify({
					description = 'You Got It Wrong!',
					showDuration = true,
					position = 'top',
					style = {
						backgroundColor = '#FF8484', 
						color = '#FFFFFF', 
						['.description'] = {
							color = '#FFFFFF' 
						}
					},
					type = 'error',
					iconColor = '#FF1616' 
				})
				return end


	local alertintroo = lib.alertDialog({
		header = 'Hunting License',
		content = 'Hunting License: Citizens wishing to engage in legal hunting within Melbourne City must possess a valid hunting license from the MCWLA that is not expired. Storage of Weapons: After hunting, or at any time when weapons are not in use, they must be stored either in a vehicle or in a designated storage area. Hunting Zones: Hunting will take place in designated zones determined by the city government.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'Next Page',
		}
	})			
	if alertintroo == 'cancel' then ExecuteCommand ("e c") return end
	
	local alertpenaltiesss = lib.alertDialog({
		header = 'Penalties',
		content = 'Violation of acts may result In fines, or suspension even revocation of the weapon license depending on the offense. unauthorized carrying of lethal weapon In state of public places and hunting In non zone areas may have severe penalties.',
		centered = true,
		cancel = true,
		labels = {
			confirm = 'I Agree',
		}
	})
	if alertpenaltiesss == 'cancel' then ExecuteCommand ("e c") return end

	lib.progressBar({
		duration = 2000,
		label = 'Checking Background',
		useWhileDead = false,
		canCancel = true,
	})

	lib.progressBar({
		duration = 2000,
		label = 'Checking Balance',
		useWhileDead = false,
		canCancel = true,
	})

	TriggerServerEvent('huntinglicense')
ExecuteCommand ("e c")
end)





-- Concealed Firearms License Notify
  RegisterNetEvent('concealedlicensesucces', function(...)
	lib.notify({
		title = 'Victorian Firearms License',
		description = 'Successfully Purchased A Concealed Firearms License Well Done!',
		type = 'success',
		position = 'top',
		duration = 5000
	})
	local alert = lib.alertDialog({
		header = 'Victoria Goverment',
		content = 'Well Done finishing your test now you will be granted a Concealed Firearms License that can be used to buy a gun from the gun store and remember to have that license with you at all times!',
		centered = true,
		cancel = true
	})
  end)

RegisterNetEvent('concealedlicensefail', function(...)
	lib.notify({
		description = 'You Unsuccessfully Purchased A Concealed Firearms License Due To Insufficient Funds.',
		showDuration = true,
		position = 'top',
		style = {
			backgroundColor = '#FF8484', 
			color = '#FFFFFF', 
			['.description'] = {
				color = '#FFFFFF' 
			}
		},
		type = 'error',
		iconColor = '#FF1616' 
	})


end)


-- Open Carry Firearms License Notify
RegisterNetEvent('opencarrylicensesucces', function(...)
	lib.notify({
		title = 'Victorian Firearms License',
		description = 'Successfully Purchased A Opencarry Firearms License Well Done!',
		type = 'success',
		position = 'top',
		duration = 5000
	})
	local alert = lib.alertDialog({
		header = 'Victoria Goverment',
		content = 'Well Done finishing your test now you will be granted a Open Carry Firearms License that can be used to buy a gun from the gun store and remember to have that license with you at all times!',
		centered = true,
		cancel = true
	})
  end)


RegisterNetEvent('opencarrylicensefail', function(...)
lib.notify({
	description = 'You Unsuccessfully Purchased A Opencarry Firearms License Due To Insufficient Funds.',
	showDuration = true,
	position = 'top',
	style = {
		backgroundColor = '#FF8484', 
		color = '#FFFFFF', 
		['.description'] = {
			color = '#FFFFFF' 
		}
	},
	type = 'error',
	iconColor = '#FF1616' 
})
end)


-- Hunting License Notify
RegisterNetEvent('huntinglicensesucces', function(...)
	lib.notify({
		description = 'You Successfully Purchased A Hunting License Well Done!',
		showDuration = true,
		position = 'top',
		style = {
			backgroundColor = '#0CA678', 
			color = '#FFFFFF', 
			['.description'] = {
				color = '#FFFFFF' 
			}
		},
		type = 'success',
		iconColor = '#B2F2BB' 
	})
	local alert = lib.alertDialog({
		header = 'Victoria Goverment',
		content = 'Well Done finishing your test now you will be granted a hunting license! PLEASE Remember to use the hunting license in zones with your hunting equipment also when leaving the zones please put you equipment away',
		centered = true,
		cancel = true
	})
  end)


RegisterNetEvent('huntinglicensefail', function(...)

	lib.notify({
		description = 'You Unsuccessfully Purchased A Hunting License Due To Insufficient Funds.',
		showDuration = true,
		position = 'top',
		style = {
			backgroundColor = '#FF8484', 
			color = '#FFFFFF', 
			['.description'] = {
				color = '#FFFFFF' 
			}
		},
		type = 'error',
		iconColor = '#FF1616' 
	})
end)
