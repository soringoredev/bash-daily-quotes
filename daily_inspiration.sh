#!/bin/bash

get_inspirational_quote() {
    response=$(curl -s https://zenquotes.io/api/random)
    quote=$(echo "$response" | jq -r '.[0].q')
    author=$(echo "$response" | jq -r '.[0].a')

    if [[ "$quote" != "null" ]] && [[ "$author" != "null" ]]; then
        echo -e "✨ Inspirational Quote for Today ✨\n\"$quote\"\n- $author\n🕒 Generated on $(date '+%Y-%m-%d %H:%M:%S')"
    else
        echo "⚠️ Error fetching the quote. Please try again later."
    fi
}

get_inspirational_quote
