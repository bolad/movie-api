class Api::V1::MoviesController < Api::V1::ApiController
  before_action :set_movie, only: %i[show update destroy]

  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    render json: @movie
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end
