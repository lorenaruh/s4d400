CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.
*    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
*      IMPORTING keys FOR Rating~DetermineRatingDate.
*
*    METHODS DetermineUserName FOR DETERMINE ON SAVE
*      IMPORTING keys FOR Rating~DetermineUserName.

ENDCLASS.


CLASS lhc_Movie IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.
    DATA movies TYPE TABLE FOR READ RESULT ZR_08_MovieTP.
*    DATA failed_travels type RESPONSE FOR failed ZR_08_TravelTP.

    " Read Movies
    READ ENTITIES OF ZR_08_MovieTP IN LOCAL MODE
         ENTITY Movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT movies.

    " Process Movies
    LOOP AT movies INTO DATA(movie).

      " Validate Genre and Create Error Message
      SELECT SINGLE FROM ZI_08_GenreVH
        FIELDS @abap_true
        WHERE Genre = @movie-Genre
        INTO @DATA(exists).

      IF exists = abap_false. " If exists is initial "if exists = ''
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>no_genre_found
                                            genre    = movie-Genre
                                            severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.

*         failed_travels-travel
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

*  METHOD DetermineRatingDate.
*    DATA ratings TYPE TABLE FOR UPDATE ZR_08_RatingTP.
*
*    LOOP AT keys INTO DATA(key).
*
*      APPEND VALUE #( %tky       = key-%tky
*                      RatingDate = sy-datum ) TO ratings.
*    ENDLOOP.
*
*    MODIFY ENTITIES OF ZR_08_MovieTP IN LOCAL MODE
*           ENTITY Raiting
*           UPDATE
*           FIELDS ( RatingDate )
*           WITH ratings.
*  ENDMETHOD.
*
*  METHOD DetermineUserName.
*    DATA ratings TYPE TABLE FOR UPDATE ZR_08_RatingTP.
*
*    LOOP AT key INTO DATA(key).
*      APPEND VALUE #( %tky     = key-%tky
*                      UserName = sy-uname )
*             TO ratings.
*    ENDLOOP.
*
*    MODIFY ENTITIES OF ZR_08_MovieTP IN LOCAL MODE
*           ENTITY Raiting
*           UPDATE
*           FIELDS ( UserName )
*           WITH ratings.
*  ENDMETHOD.
ENDCLASS.
