import { useState, useEffect } from 'react';

function useScroll() {
    const [scrollPosition, setScrollPosition] = useState({top: 0, left: 0, scrolledPage: false})

    useEffect(() => {
        const main = document.getElementById('default-main')

        const handleScroll = () => {
            setScrollPosition({
                scrollTop: main.scrollTop,
                scrollLeft: main.scrollLeft,
                scrolledPage: true
            })

            clearTimeout(window.scrollTimeout);

            window.scrollTimeout = setTimeout(() => {
                setScrollPosition({...scrollPosition, scrolledPage: false})
            }, 10);
        }

        main.addEventListener('scroll', handleScroll)

        return () => {
            main.removeEventListener('scroll', handleScroll)
        }
    }, [])

    return scrollPosition
}

export default useScroll
