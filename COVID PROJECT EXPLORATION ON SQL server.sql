select *
from [Portfolio Project].dbo.CovidDeaths$
order by 3,4

--select *
--from [Portfolio Project].dbo.CovidVaccinations$
--order by 3,4

select location, date, total_cases, new_cases, total_deaths, population 
from [Portfolio Project].dbo.CovidDeaths$
ORDER BY 1,2

--LOOKING AT THE TOTAL CASES VS THE TOTAL DEATHS

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
from [Portfolio Project].dbo.CovidDeaths$
where location like '%Nigeria%'
ORDER BY 1,2


--LOOKING AT TOTAL CASES VS POPULATION
--SHOWS THE PERCENTAGE OF POPULATION WHO GOT COVID
select location, date, total_cases,population, (total_cases/population)*100 AS DeathPercentage
from [Portfolio Project].dbo.CovidDeaths$
where location like '%Nigeria%'
ORDER BY 1,2

--SHOWING COUNTRIES WITH HIGH DEATH COUNTS PER POPULATON

select location, max(cast(total_deaths as int)) as TotalDeathCounts
from [Portfolio Project].dbo.CovidDeaths$
--where location like '%Nigeria%'
where continent is not null
group by location
ORDER BY Totaldeathcounts desc

--BREAKING DOWN BY CONTINENT
select continent, max(cast(total_deaths as int)) as TotalDeathCounts
from [Portfolio Project].dbo.CovidDeaths$
--where location like '%Nigeria%'
where continent is NOT null
group by continent
ORDER BY Totaldeathcounts desc

--GLOBAL NUMBERS
select date, SUM(new_cases) AS TOTAL_CASES, SUM(CAST(new_deaths AS INT)) AS TOTAL_DEATHS, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS DEATHPERCENTAGE
from [Portfolio Project].dbo.CovidDeaths$
--where location like '%Nigeria%'
WHERE continent IS NOT NULL
GROUP BY DATE
ORDER BY 1,2


SELECT *
FROM [Portfolio Project]..CovidDeaths$ dea
JOIN [Portfolio Project]..CovidVaccinations$ vac
    ON dea.location = vac.location
	 and  dea.date = vac.date

	 --LOOKING AT TOTAL POPULATION VS VACCINATION

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM [Portfolio Project]..CovidDeaths$ dea
JOIN [Portfolio Project]..CovidVaccinations$ vac
    ON dea.location = vac.location
	 and  dea.date = vac.date
	 where dea.continent is not null
	 order by 2,3

