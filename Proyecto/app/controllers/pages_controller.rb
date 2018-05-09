class PagesController < ApplicationController
  def dashboard
    @raws = Raw.all
    @recipes = Recipe.all
    @products = Product.as(:p).where("p.expired_at > #{Date.today.strftime('%s')}")

    # 
    # Graphs data
    # 

    # Products losses
    dates_products = []
    costs_products = []
    Neo4j::ActiveBase.current_session.query("MATCH (p: Product{expired: true})-[h: has_recipe]->(r: Recipe) WITH p, r, p.expired_at as date RETURN SUM(r.cost) AS cost_per_month, date ORDER BY date ASC LIMIT 6").each do |month|
      dates_products << Time.at(month.date).strftime("%B %y")
      costs_products << (month.cost_per_month).round(2)
    end

    @total_lost_products = Neo4j::ActiveBase.current_session.query("MATCH (p: Product{expired: true})-[h: has_recipe]->(r: Recipe) WITH p, r, p.expired_at as date RETURN SUM(r.cost) as total").first.total    

    @bar_data = {
      labels: dates_products,
      datasets: [
        {
          label: "Lost",
          backgroundColor: "rgba(220,20,60,0.2)",
          borderColor: "rgba(220,20,60,1)",
          lineTension: 0.3,
          pointRadius: 2,
          pointBackgroundColor: "rgba(220,20,60,1)",
          pointBorderColor: "rgba(220,20,60,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(220,20,60,1)",
          pointHitRadius: 20,
          pointBorderWidth: 2,
          data: costs_products
        }
      ]
    }
    @bar_options = {
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            min: 0,
            max: costs_products.max != nil ? costs_products.max + 10 : 0,
            maxTicksLimit: 5
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          }
        }],
      },
      legend: {
        display: false
      },
      height: "320"
    }

    # Raw losses
    dates_raws = []
    costs_raws = []
    Neo4j::ActiveBase.current_session.query("MATCH (r: RawInventory{expired: true})-[rel: raw_expired]->(ra: Raw) WITH r, ra, r.expired_at as date RETURN SUM(r.quantity * ra.cost) AS cost_per_month, date ORDER BY date ASC LIMIT 6").each do |month|
      dates_raws << Time.at(month.date).strftime("%B %y")
      costs_raws << (month.cost_per_month).round(2)
    end

    @total_lost_raws = Neo4j::ActiveBase.current_session.query("MATCH (r: RawInventory{expired: true})-[rel: raw_expired]->(ra: Raw) WITH r, ra, r.expired_at as date RETURN SUM(r.quantity * ra.cost) as total").first.total    

    @bar_data_raws = {
      labels: dates_raws,
      datasets: [
        {
          label: "Lost",
          backgroundColor: "rgba(220,20,60,0.2)",
          borderColor: "rgba(220,20,60,1)",
          lineTension: 0.3,
          pointRadius: 2,
          pointBackgroundColor: "rgba(220,20,60,1)",
          pointBorderColor: "rgba(220,20,60,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(220,20,60,1)",
          pointHitRadius: 20,
          pointBorderWidth: 2,
          data: costs_raws
        }
      ]
    }
    @bar_options_raws = {
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            min: 0,
            max: costs_raws.max != nil ? costs_raws.max + 1000 : 0,
            maxTicksLimit: 5
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          }
        }],
      },
      legend: {
        display: false
      },
      height: "320"
    }

    # Costs of warehouses
    
    raw_warehouse = Neo4j::ActiveBase.current_session.query("MATCH (r: RawInventory)-[rel: raw]->(ra: Raw) WITH r, ra RETURN SUM(r.quantity * ra.cost) as total").first.total    
    product_warehouse = Neo4j::ActiveBase.current_session.query("MATCH (p: Product{expired: false})-[rel: has_recipe]->(r: Recipe) WITH r, p RETURN SUM(r.cost) as total").first.total    

    @warehouses_data = {
      labels: ["Raw", "Products"],
      datasets: [{
        data: [(raw_warehouse).round(2), (product_warehouse).round(2)],
        backgroundColor: ['rgb(30,144,255)', 'rgb(100,149,237)'],
      }]
    }

    @warehouses_options = {
    }

    @warehouses_total_value = raw_warehouse + product_warehouse

  end

  def not_found
  end
end
