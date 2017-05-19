require 'xcodeproj'

project = Xcodeproj::Project.open('Example/EarlGreySnapshots.xcodeproj')

project.targets.each do |target|
  if target.name == 'EarlGreySnapshots_Tests'
    target.copy_files_build_phases.each do |copy_phase|
      if copy_phase.name == 'EarlGrey Copy Files'
        copy_phase.remove_from_project
      end	
    end
  end
end

project.save()
