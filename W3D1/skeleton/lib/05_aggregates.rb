# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)
    select distinct
      continent
    from
      countries
    
  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
    select
      SUM(gdp) 
    from
      countries
    where
      continent = 'Africa'
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
    select
      COUNT(name)
    from
      countries
    where
      area > 1000000
  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)
    select
      SUM(population) 
    from
      countries
    where
      name = 'France' OR name = 'Germany' OR name = 'Spain' 
  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
    SELECT
      continent, COUNT(name)
    FROM
      countries
    GROUP BY
      continent
    
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
    SELECT
      continent, COUNT(population)
    FROM
      countries
      WHERE
        population >= 10000000
      GROUP BY
      continent
      
  SQL
end

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
    SELECT
      continent
    FROM
      countries
    GROUP BY
      continent
    HAVING
      SUM(population) >= 100000000
  SQL
end
