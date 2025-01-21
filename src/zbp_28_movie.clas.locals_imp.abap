CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS validate_genre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validate_genre.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validate_genre.
    READ ENTITY IN LOCAL MODE zi_28_movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    " Filme sequentiell verarbeiten
    LOOP AT movies INTO DATA(movie).
      " Genre prüfen
      SELECT SINGLE
        FROM ddcds_customer_domain_value_t( p_domain_name = 'ZABAP_GENRE' )
        FIELDS @abap_true
        WHERE value_low = @movie-Genre
        INTO @DATA(exists).
      IF exists = abap_false.
        DATA(message) = NEW zcm_28_movie( textid   = zcm_28_movie=>zcm_28_movie
                                          severity = if_abap_behv_message=>severity-error
                                          value    = CONV #( movie-genre )
                                          field    = 'Genre' ).
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        %element-Genre = if_abap_behv=>mk-on ) to reported-movie.
        APPEND CORRESPONDING #( movie ) TO failed-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
