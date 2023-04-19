require 'json'
require_relative 'Monster'
require_relative 'MonsterFactory'

class DataReader
    def initialize(dataSourcePath)
        @dataSourcePath = dataSourcePath
    end
    
    def readData(data_type)
        json_data = File.read(@dataSourcePath)
        data = JSON.parse(json_data)[data_type]

        return data.map do |item|
            case data_type
                when 'monsters'
                    return Monster.new(item['name'], item['health'], item['attack'], item['defense'], item['type'])    
                when 'trainers'
                    newTrainer = Trainer.new(item['name'])
                    item['monsters'].map do |monster|
                        newTrainer.addMonster(MonsterFactory.createMonster(monster['name'], monster['health'], monster['attack'], monster['defense'], monster['type']))
                    end
                    newTrainer
                end 
        end
    end
end